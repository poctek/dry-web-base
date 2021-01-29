# frozen_string_literal: true

module RubyBase
  class Container < Dry::System::Container
    configure do
      config.name = :ruby_base
      config.default_namespace = 'ruby_base'
      config.auto_register = %w(lib)
    end

    load_paths! 'lib'
  end
end
