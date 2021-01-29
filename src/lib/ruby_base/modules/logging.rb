# frozen_string_literal: true

module RubyBase
  module Modules
    module Logging
      def log_error_message(message, raven_context)
        RubyBase::Container[:logger].error(message)
        Sentry.extra_context(raven_context)
        Sentry.capture_message(message)
      end
    end
  end
end
