# frozen_string_literal: true

module Base
  def self.included(klass)
    klass.include Dry::Monads[:result]
    klass.include RubyBase::Modules::Logging
  end

  def params
    request.params.transform_keys(&:to_sym)
  end

  def resolve(key)
    RubyBase::Container[key]
  end
end
