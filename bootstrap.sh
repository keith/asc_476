#!/usr/bin/env bash

set -e

if ! which ruby &> /dev/null;then
    echo "Ruby must be installed"
    exit
fi

if ! which bundle &> /dev/null;then
    echo "Bundler must be installed"
    exit
fi

bundle install
rake db:create
rake db:migrate
rake db:seed

echo "Finished"
