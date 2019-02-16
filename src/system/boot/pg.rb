# frozen_string_literal: true

RubyBase::Container.boot :pg do
  init do
    require 'sequel/core'
  end

  start do |container|
    use :pg_config

    config = container[:pg_config]

    connection_params = {
      adapter: :postgres,
      host: config.host,
      port: config.port,
      database: config.database,
      username: config.username.value_or(nil),
      password: config.password.value_or(nil),
      max_connections: config.max_connections.value_or(nil)
    }

    register :pg, Sequel.connect(connection_params)
  end
end
