#!/bin/bash
GEM_HOME=~/rubygems
./bin/thin stop -d -e production --servers 4
./bin/thin start -d -e production --servers 4
