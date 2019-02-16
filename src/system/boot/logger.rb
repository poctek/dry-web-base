# frozen_string_literal: true

RubyBase::Container.boot :logger do
  start do |container|
    use :application_config

    config = container[:application_config]

    container[:logger].level = config.log_level.value_or(0)
  end
end
