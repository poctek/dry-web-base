# frozen_string_literal: true

require 'ruby_base/types/types'

module RubyBase
  module Types
    module Configs
      class BaseConfig < Dry::Struct
        def self.load(root, filename, env, env_prefix = '')
          path = root.join('config', "#{filename}.yml")
          yaml = File.exist?(path) ? YAML.load_file(path) : {}
          config = schema.keys.each_with_object({}) do |key, memo|
            env_key = env_prefix.empty? ? key.to_s.upcase : "#{env_prefix}_#{key}".upcase
            memo[key] = ENV.fetch(
              env_key,
              yaml.fetch(env, {})[key.to_s]
            )
          end

          new(config)
        end
      end
    end
  end
end
