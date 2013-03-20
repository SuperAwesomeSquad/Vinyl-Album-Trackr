#!/bin/bash
export RAILS_ENV=production
export GEM_HOME=~/rubygems
./bin/thin stop -d -e production --servers 4
git fetch
git merge origin/master
bundle install
rake db:migrate
rake assets:precompile
./bin/thin start -d -e production --servers 4
