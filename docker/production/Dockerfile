FROM whalesburgcom/ruby:latest

RUN mkdir /ruby_base

WORKDIR /ruby_base

COPY ./src/Gemfile /ruby_base/Gemfile
COPY ./src/Gemfile.lock /ruby_base/Gemfile.lock

RUN bundle install --system -j8 --without development test

COPY ./src /ruby_base

COPY ./src/config/application.example.yml config/application.yml
COPY ./src/config/pg.example.yml config/pg.yml
COPY ./src/config/influx.example.yml config/influx.yml
COPY ./src/config/redis.example.yml config/redis.yml

COPY ./docker/production/docker-entrypoint.sh /sbin/
RUN chmod +x /sbin/*.sh

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]
