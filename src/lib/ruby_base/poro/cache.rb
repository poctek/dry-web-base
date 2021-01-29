# frozen_string_literal: true

module RubyBase
  module Poro
    class Cache
      include Dry::Monads[:result, :try, :maybe]

      include Import[:logger, :redis]

      CACHE_NAMESPACE = :ruby_base_cache

      def fetch(key, lifetime = nil, &block)
        cached_value = Try() { redis.get(namespaced_key(key)) }
        cached_value.bind do |value|
          return Success(JSON.parse(value)) if value

          logger.info "[CACHE] Setting data in key: #{namespaced_key(key)}"

          data = yield block
          data.bind do |result|
            redis.set(namespaced_key(key), result.to_json)
            redis.expire(namespaced_key(key), lifetime) if lifetime
          end
          return data
        end
        cached_value.or { yield block }
      end

      def set(key, value)
        logger.info "[CACHE] Setting data in key: #{namespaced_key(key)}"

        Try() do
          redis.set(namespaced_key(key), value.to_json)
          value
        end
      end

      def get(key)
        Try() { redis.get(namespaced_key(key)) }.fmap do |value|
          Maybe(value).bind { |json_string| JSON.parse(json_string) }
        end
      end

      private

      def namespaced_key(key)
        "#{CACHE_NAMESPACE}:#{key}"
      end
    end
  end
end
