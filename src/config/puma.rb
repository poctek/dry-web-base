# frozen_string_literal: true

threads_count = ENV.fetch('RACK_MAX_THREADS') { 5 }
threads threads_count, threads_count

port ENV.fetch('PORT') { 3002 }

environment ENV.fetch('RACK_ENV') { 'development' }

workers ENV.fetch('WEB_CONCURRENCY') { 2 }
