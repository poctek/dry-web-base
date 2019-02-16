# frozen_string_literal: true

namespace :influx do
  desc 'Create database'
  task :create do
    require 'influxdb'
    require_relative '../../../system/ruby_base/container'

    RubyBase::Container.start :influx
    config = RubyBase::Container[:influx_config]
    influx = RubyBase::Container[:influx].connection

    config.database.bind do |database|
      influx.create_database database
      puts "Database #{database} created sucessfully"
    end
  end
end
