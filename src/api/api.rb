# frozen_string_literal: true

require_relative 'base'

class API < Roda
  include Base

  plugin :json

  route do |r|
    r.root do
      result = resolve('operations.example').(params)

      case result
      when Success
        result.value!
      when Failure
        result.failure.to_h
      end
    end
  end
end
