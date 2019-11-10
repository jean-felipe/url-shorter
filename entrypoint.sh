#!/bin/bash

set -e
echo '--- run yarn install'
yarn install

rails db:setup db:seed

if [ 0 -lt $(ls /usr/local/bundle/gems/rails* 2>/dev/null | wc -w) ]; then
     bundle install
else
    bundle install
    rake db:setup
fi

exec "$@"
