# frozen_string_literal: true

module RubyBase
  module Shared
    module Logging
      NAMESPACE = 'ruby_base'

      include Import[:logging_influx, :logger]

      def write_consumed_time_to_influx(metric_name, time)
        values = {
          values: {
            success: true,
            time_consumed: time
          }
        }

        logging_influx.write_point("#{NAMESPACE}_#{metric_name}", values, 'ms', 'one_week')
      end
    end
  end
end
