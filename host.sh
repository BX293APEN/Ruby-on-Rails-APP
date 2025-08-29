#!/bin/bash

# .envから値を読み込み
set -a
source .env
set +a

# Gemfile.lockの更新
GEMFILE="${VOLUME}/ruby/Gemfile"
LOCKFILE="${VOLUME}/ruby/Gemfile.lock"

if [ ! -f "${LOCKFILE}" ]; then
    sudo apt update
    sudo apt install -y ruby-full libpq-dev
    sudo gem install bundler
    bundle install --gemfile "${GEMFILE}"
fi

docker compose run --rm web rake db:create

docker compose up --build -d