# frozen_string_literal: true

require 'ruby_base/types/types'

module RubyBase
  module Types
    module Configs
      class BaseConfig < Dry::Struct
        def self.from_file(root, filename, env)
          path = root.join('config', "#{filename}.yml")
          erb = ERB.new(File.read(path)).result
          yaml = File.exist?(path) ? YAML.safe_load(erb, aliases: true) : {}
          config = schema.keys.each_with_object({}) do |key, memo|
            key = key.name
            memo[key] = yaml.fetch(env, {})[key.to_s]
          end

          new(config)
        end
      end
    end
  end
end

