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

require 'ruby_base/types/configs/base_config'

Dir['./lib/ruby_base/types/*.rb'].each { |file| require file }
Dir['./lib/ruby_base/modules/*.rb'].each { |file| require file }
Dir['./lib/ruby_base/types/**/*.rb'].each { |file| require file }

RubyBase::Container.finalize!

require 'ruby_base/web'
