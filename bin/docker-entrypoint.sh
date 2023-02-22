#!/bin/sh

set -x

if [ ! -d tmp ]; then
  mkdir tmp
fi

if [ ! -d tmp/pids ]; then
  mkdir tmp/pids
fi

if [ "$(ls tmp/pids)" ]; then
  rm tmp/pids/*.pid
fi

bundle check || bundle install --jobs 20 --retry 5
bundle exec rake db:create db:migrate
bundle exec rails s -p 3000 -b 0.0.0.0

echo "exiting docker-entrypoint script"
