# frozen_string_literal: true

RubyBase::Container.boot :monitor do
  init do
    require 'dry/monitor'
  end

  start do
    Dry::Monitor::SQL::Logger.new(logger).subscribe(notifications)
  end
end
