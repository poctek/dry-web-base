# frozen_string_literal: true

require 'ruby_base/types/configs/base_config'

module RubyBase
  module Types
    module Configs
      class PG < BaseConfig
        attribute :host, Types::Strict::String
        attribute :port, Types::Strict::Integer

        attribute :username, Types::Maybe::Strict::String
        attribute :password, Types::Maybe::Strict::String

        attribute :max_connections, Types::Maybe::Strict::Integer

        attribute :database, Types::Strict::String
      end
    end
  end
end
