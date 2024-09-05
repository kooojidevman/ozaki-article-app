#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f ./tmp/pids/server.pid

# Wait for the database to be ready before proceeding.
# The script waits for the database service at db:3306 to become available.
./entrypoint-script/wait-for-it.sh db:3306

# Run database commands
bundle exec rails db:create
bundle exec rails db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
