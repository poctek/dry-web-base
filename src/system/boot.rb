# frozen_string_literal: true

require 'bundler/setup'
require_relative 'application'

begin
  require 'pry-byebug'
rescue LoadError => e
  puts e
end

require_relative 'ruby_base/container'
require_relative 'ruby_base/import'

RubyBase::Container.finalize!

require 'ruby_base/web'
