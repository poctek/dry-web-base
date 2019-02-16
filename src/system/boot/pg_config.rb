# frozen_string_literal: true

RubyBase::Container.boot :pg_config do
  init do
    require 'ruby_base/types/configs/pg'
  end

  start do |container|
    root = container.root
    env = ENV.fetch 'RACK_ENV', 'development'

    pg = RubyBase::Types::Configs::PG.load(root, 'pg', env, :pg)
    register :pg_config, pg.freeze
  end
end
