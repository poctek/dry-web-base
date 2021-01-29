# frozen_string_literal: true

Dry::Types.load_extensions(:maybe)
module RubyBase
  module Types
    include Dry::Types()
  end
end
