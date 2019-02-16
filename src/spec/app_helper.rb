# frozen_string_literal: true

require 'spec_helper'
require 'dry/system/stubs'
require_relative '../system/ruby_base/container'
require_relative '../system/ruby_base/import'
require_relative '../system/application'

RubyBase::Container.enable_stubs!

RubyBase::Container.finalize!
