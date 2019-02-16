#! /bin/bash

set -e

bundle check || bundle install --system -j8 --without development test

bundle exec rake db:migrate

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

exec "$@"
