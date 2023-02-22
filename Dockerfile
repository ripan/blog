FROM ruby:2.7.6-slim

COPY Gemfile Gemfile.lock /usr/src/app/

WORKDIR /usr/src/app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && \
  bundle install --jobs 20 --retry 5

COPY . /usr/src/app
ENV HOME=/usr/src/app PATH=/usr/src/app/bin:$PATH

RUN chmod +x /usr/src/app/bin/docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["bash","/usr/src/app/bin/docker-entrypoint.sh"]
