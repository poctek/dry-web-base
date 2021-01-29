# frozen_string_literal: true

RubyBase::Container.boot :sentry do
  init do
    require 'sentry-ruby'
  end

  start do |container|
    use :application_config

    Sentry.init do |config|
      config.dsn = container[:application_config].raven_dsn.value_or(nil)
    end
  end
end
