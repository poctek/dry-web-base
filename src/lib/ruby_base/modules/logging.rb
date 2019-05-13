# frozen_string_literal: true

module RubyBase
  module Modules
    module Logging
      def log_error_message(message, raven_context)
        RubyBase::Container.logger.error(message)
        Raven.extra_context(raven_context)
        Raven.capture_message(message)
      end
    end
  end
end
