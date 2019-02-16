# frozen_string_literal: true

RubyBase::Container.boot :raven do
  init do
    require 'raven'
  end

  start do |container|
    use :application_config

    Raven.configure do |config|
      config.dsn = container[:application_config].raven_dsn.value_or(nil)
      config.environments = %w(production stage)
    end
  end
end
