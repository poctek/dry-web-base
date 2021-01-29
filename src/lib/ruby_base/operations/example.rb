# frozen_string_literal: true

module RubyBase
  module Operations
    class Example
      include Base

      contract do
        schema do
          required(:value).filled(:int?)
        end
      end

      def call(input)
        yield validate_contract(input)

        logger.info 'All right'

        Success(input)
      end
    end
  end
end
