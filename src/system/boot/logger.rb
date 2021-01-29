# frozen_string_literal: true

RubyBase::Container.boot :logger do
  start do |container|
    use :application_config

    config = container[:application_config]

    logger = Logger.new($stdout)
    logger.level = config.log_level.value_or(0)

    logger.formatter = proc do |severity, datetime, progname, msg|
      if progname
        "#{datetime.utc}: [#{severity.upcase}] - #{progname} - #{msg}\n"
      else
        "#{datetime.utc}: [#{severity.upcase}] #{msg}\n"
      end
    end

    register :logger, logger
  end
end
