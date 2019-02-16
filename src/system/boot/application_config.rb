# frozen_string_literal: true

RubyBase::Container.boot :application_config do
  init do
    require 'ruby_base/types/configs/application'
  end

  start do |container|
    root = container.root
    env = ENV.fetch 'RACK_ENV', 'development'

    application = RubyBase::Types::Configs::Application.load(root, 'application', env)

    register :application_config, application.freeze
  end
end
