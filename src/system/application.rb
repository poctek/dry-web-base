# frozen_string_literal: true

require 'erb'
require 'yaml'

require 'dry/system/container'
require 'dry/monads/all'
require 'dry/validation'
require 'dry/transaction/operation'
require 'dry-struct'
require 'dry-types'

Dry::Validation.load_extensions(:monads)
