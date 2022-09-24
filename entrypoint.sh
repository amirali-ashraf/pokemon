#!/bin/sh
bin/rails db:drop db:create db:migrate db:seed
rm -f tmp/pids/server.pid
bundle install
bundle exec rails s -p 3000 -b '0.0.0.0'