FROM ruby:2.7.2-slim-buster

RUN mkdir /ruby_base

WORKDIR /ruby_base

RUN bundle install --system -j8 --without development test

COPY ./src /ruby_base

COPY ./src/config/application.example.yml config/application.yml
COPY ./src/config/pg.example.yml config/pg.yml
COPY ./src/config/influx.example.yml config/influx.yml
COPY ./src/config/redis.example.yml config/redis.yml

COPY ./docker/stage/docker-entrypoint.sh /sbin/
RUN chmod +x /sbin/*.sh

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]
