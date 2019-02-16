# frozen_string_literal: true

RubyBase::Container.boot :influx_config do
  init do
    require 'ruby_base/types/configs/influx'
  end

  start do |container|
    root = container.root
    env = ENV.fetch 'RACK_ENV', 'development'

    influx = RubyBase::Types::Configs::Influx.load(root, 'influx', env, :influx)
    register :influx_config, influx.freeze
  end
end
