#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
# Apparently this is required as per https://docs.docker.com/compose/rails/
rm -f /template/tmp/pids/server.pid

# Start the Selenium server in the background
# java -jar selenium-server-standalone.jar -port 4444 &

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
