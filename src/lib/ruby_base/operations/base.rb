# frozen_string_literal: true

# auto_register: false

module RubyBase
  module Operations
    module Base
      def self.included(klass)
        klass.include Dry::Transaction::Operation
        klass.include Modules::Logging
      end
    end
  end
end
