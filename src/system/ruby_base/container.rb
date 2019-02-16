# frozen_string_literal: true

require 'dry/web/container'
require 'dry/system/components'

module RubyBase
  class Container < Dry::Web::Container
    configure do
      config.name = :ruby_base
      config.listeners = true
      config.default_namespace = 'ruby_base'
      config.auto_register = %w(lib/ruby_base)
    end

    load_paths! 'lib'
  end
end
