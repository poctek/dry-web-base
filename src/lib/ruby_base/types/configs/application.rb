# frozen_string_literal: true

module RubyBase
  module Types
    module Configs
      class Application < BaseConfig
        attribute :raven_dsn, Types::Maybe::Strict::String
        attribute :log_level, Types::Maybe::Coercible::Integer
      end
    end
  end
end
