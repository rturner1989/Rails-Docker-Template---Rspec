#!/bin/bash

echo "Template App MIGRATING Database"
echo "================="
docker compose run --rm app rails db:migrate

echo "Finished!"
