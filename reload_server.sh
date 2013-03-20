#!/bin/bash
RAILS_ENV=production
./bin/thin stop -d -e production --servers 4
git fetch
git merge origin/master
bundle install
rake db:migrate
rake assets:precompile
./bin/thin start -d -e production --servers 4
