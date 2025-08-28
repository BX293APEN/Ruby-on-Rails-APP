#!/bin/bash

# .envから値を読み込み
set -a
source .env
set +a

DB_FILE="${VOLUME}/ruby/db/development.sqlite3" 

if [ -f "$DB_FILE" ]; then
  echo "SQLite DB file exists at $DB_FILE. Skipping db:create."
else
  echo "SQLite DB file not found. Running 'docker compose run web rake db:create'..."
  docker compose run web rake db:create
fi

docker compose up --build -d