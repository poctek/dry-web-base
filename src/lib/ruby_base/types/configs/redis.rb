# frozen_string_literal: true

require 'ruby_base/types/configs/base_config'

module RubyBase
  module Types
    module Configs
      class Redis < BaseConfig
        attribute :host, Types::Maybe::Strict::String
        attribute :port, Types::Maybe::Coercible::Integer
      end
    end
  end
end
