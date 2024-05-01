#!/bin/bash

echo "Template App ROLLBACK Database"
echo "================="
docker compose run --rm app rails db:rollback

echo "Finished!"
