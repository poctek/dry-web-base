# frozen_string_literal: true

RubyBase::Container.boot :redis_config do
  init do
    require 'ruby_base/types/configs/redis'
  end

  start do |container|
    root = container.root
    env = ENV.fetch 'RACK_ENV', 'development'

    redis = RubyBase::Types::Configs::Redis.from_file(root, 'redis', env)
    register :redis_config, redis.freeze
  end
end
