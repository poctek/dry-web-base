# frozen_string_literal: true

require 'ruby_base/types/configs/base_config'

module RubyBase
  module Types
    module Configs
      class Influx < BaseConfig
        attribute :host, Types::Maybe::Strict::String
        attribute :port, Types::Maybe::Strict::Integer

        attribute :username, Types::Maybe::Strict::String
        attribute :password, Types::Maybe::Strict::String

        attribute :database, Types::Maybe::Strict::String
        attribute :health_metrics_db, Types::Maybe::Strict::String
      end
    end
  end
end
