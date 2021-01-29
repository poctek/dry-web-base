# frozen_string_literal: true

RubyBase::Container.boot :redis do
  init do
    require 'redis'
  end

  start do |container|
    use :redis_config

    config = container[:redis_config]
    host = config.host.value_or(nil)
    port = config.port.value_or(nil)
    redis = Redis.new(host: host, port: port)

    register :redis, redis
  end
end
