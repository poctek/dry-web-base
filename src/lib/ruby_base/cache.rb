# frozen_string_literal: true

require 'json'

require 'dry/monads/result'
require 'dry/monads/try'
require 'dry/monads/maybe'

module RubyBase
  class Cache
    include Dry::Monads::Result::Mixin
    include Dry::Monads::Maybe::Mixin
    include Dry::Monads::Try::Mixin

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
