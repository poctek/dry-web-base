# frozen_string_literal: true

module RubyBase
  class Web < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    plugin :error_handler
    plugin :multi_route
    plugin :json_parser
    plugin :json

    route(&:multi_route)

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    load_routes!
  end
end
