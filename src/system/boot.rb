# frozen_string_literal: true

require 'bundler/setup'
require_relative 'application'

# rubocop:disable Lint/SuppressedException
begin
  require 'pry-byebug'
rescue LoadError
end
# rubocop:enable Lint/SuppressedException

require_relative 'ruby_base/container'
require_relative 'ruby_base/import'

RubyBase::Container.finalize!
