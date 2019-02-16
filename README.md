# RubyBase

## First steps

First, navigate to the `src` folder.

Execute `bin/generate project_name`. Make sure that project_name is snake_case

1. Run `cp config/application.example.yml config/application.yml` and fill the config
2. Run `cp config/postgres.example.yml config/postgres.yml` and fill the config
3. Run `cp config/influx.example.yml config/influx.yml` and fill the config
4. Run `bundle exec rake db:create`
5. Run `bundle exec rake influx:create`

Execute `puma config.ru -C config/puma.rb` to start the app server.

## To create and run the migrations

- Create the migration: `bundle exec rake db:migration[migration_name]`
- Run the migration: `bundle exec rake db:migrate[version]`
- Rollback the migration: `bundle exec rake db:rollback[step]`. Deafult `step` is 1
- Reset the DB: `bundle exec rake db:reset`

## Development console

Execute `bin/console` to access development console

## DB console

Execute `bin/db` to access development console

## Staging docker images build notice
To make the build faster, the gems are not installed during staging CI builds. Instead, `bundle install` is called from entrypoint to make it possible to persist the gems in volume on the stage machine. If you want each run to be clean, just use production Dockerfile version for master branch builds.
