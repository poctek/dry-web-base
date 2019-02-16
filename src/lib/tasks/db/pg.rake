# frozen_string_literal: true

MIGRATION_TEMPLATE = <<~TEMPLATE
  # frozen_string_literal: true

  Sequel.migration do
    transaction

    change do
    end
  end
TEMPLATE

# rubocop:disable Metrics/BlockLength
namespace :pg do
  desc 'Migrate the db one migration up'
  task :create do
    require 'sequel/core'
    require_relative '../../../system/ruby_base/container'

    RubyBase::Container.start :pg_config
    config = RubyBase::Container[:pg_config]

    connection_params = {
      adapter: :postgres,
      host: config.host,
      port: config.port,
      database: 'postgres',
      username: config.username.value_or(nil),
      password: config.password.value_or(nil)
    }

    Sequel.connect(connection_params) do |db|
      db.execute "CREATE DATABASE #{config.database}"
      puts "Database #{config.database} created successfully"
    end
  end

  desc 'Migrate the db one migration up'
  task :migrate, :version do |_task, args|
    version = args.version if args.version
    migrate(version)
    puts 'Database migration run successfully'
  end

  desc 'Migrate the db one migration down'
  task :rollback, :steps do |_task, args|
    step = args.step || 1

    require 'sequel/core'
    require_relative '../../../system/ruby_base/container'

    DB = RubyBase::Container[:pg]
    target_migration = DB[:schema_migrations]
                       .reverse_order(:filename)
                       .offset(step)
                       .first

    if target_migration
      version = target_migration[:filename].split('_')[0].to_i

      migrate(version)
      puts "Rolled back the database #{step} migrations back"
      puts "Current database version: #{version}"
    end
  end

  desc 'Run all migrations from scratch'
  task :reset do
    migrate(0)
    migrate
    puts 'Database was reset successfully'
  end

  desc 'Create new migration'
  task :migration, :name do |_task, args|
    name = args.name
    timestamp = Time.now.utc.to_i

    filename = "#{timestamp}_#{name}.rb"
    path = File.join 'db', 'migrations', filename

    File.open path, 'w' do |file|
      file.puts MIGRATION_TEMPLATE
    end
    puts "Created migration #{name}: #{path}"
  end
end

def migrate(version = nil)
  require 'sequel/core'
  require_relative '../../../system/ruby_base/container'

  RubyBase::Container.start :pg

  Sequel.extension :migration
  db = RubyBase::Container[:pg]

  path = File.join('db', 'migrations')

  Sequel::Migrator.run(db, path, target: version) if Dir[File.join path, '*.rb'].any?
end
# rubocop:enable Metrics/BlockLength
