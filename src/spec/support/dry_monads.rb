# frozen_string_literal: true

require 'dry/monads/result'

RSpec.configure do |config|
  config.include Dry::Monads::Result::Mixin
end
