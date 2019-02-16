# frozen_string_literal: true

RubyBase::Container.boot :influx do
  init do
    require 'influxdb'
  end

  start do |container|
    use :influx_config

    config = container[:influx_config]

    base_params = {
      host: config.host.value_or(nil),
      port: config.port.value_or(nil),
      database: config.database.value_or(nil),
      username: config.username.value_or(nil),
      password: config.password.value_or(nil)
    }
    health_metrics_db = config.health_metrics_db.value_or(config.database.value_or(nil))

    base_client = InfluxDB::Client.new(base_params)

    logging_params = base_params.merge(async: true,
                                       database: health_metrics_db)
    log_client = InfluxDB::Client.new(logging_params)

    container.register :influx, base_client
    container.register :logging_influx, log_client
  end
end
