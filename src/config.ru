# frozen_string_literal: true

require 'roda'

require_relative 'system/boot'
require_relative 'api/api'

run API.freeze.app
