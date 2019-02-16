FROM whalesburgcom/ruby:latest

RUN mkdir /ruby_base

WORKDIR /ruby_base

COPY ./src /ruby_base

COPY ./src/config/application.example.yml config/application.yml
COPY ./src/config/postgres.example.yml config/postgres.yml
COPY ./src/config/influx.example.yml config/influx.yml
COPY ./src/config/redis.example.yml config/redis.yml

COPY ./docker/stage/docker-entrypoint.sh /sbin/
RUN chmod +x /sbin/*.sh

ENV BUNDLE_PATH /ruby_base/vendor/bundle

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]
