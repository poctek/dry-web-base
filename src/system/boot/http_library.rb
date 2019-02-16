# frozen_string_literal: true

RubyBase::Container.boot :http_library do
  init do
    require 'http'
  end

  start do
    register :http_library, HTTP
  end
end
