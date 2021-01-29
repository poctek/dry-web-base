# frozen_string_literal: true

module RubyBase
  module Operations
    module Base
      module ClassMethods
        def contract(&block)
          @contract = Class.new(Dry::Validation::Contract, &block)
        end
      end

      def self.included(klass)
        klass.include Dry::Monads[:result, :try]
        klass.include Dry::Monads::Do.for(:call)

        klass.include Modules::Logging

        klass.include Import[:application_config, :logger]

        klass.extend ClassMethods
      end

      def validate_contract(input)
        self.class.instance_variable_get(:@contract).new.(input).to_monad
      end
    end
  end
end
