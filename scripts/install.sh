#!/bin/bash

echo "Template App DEVELOPMENT Setup"
echo "================="

# Adds a default .env file if there isn't one already
if [ ! -f ".env" ]; then
  echo "Create .env file"
  echo "DB_USER=user
DB_PASSWORD=somepassword
DB_HOST=db
DB_PORT=3306
DB_DATABASE=template_development
REDIS_URL_SIDEKIQ=redis://redis:6379/12
REDIS_URL=redis://redis:6379" > .env
else
  echo "Using pre-created .env file"
fi

echo "Build docker container (this may take a a while...)"
docker compose build

echo "Create database"
docker compose run --rm app rails db:create

echo "Finished!"
echo "Please change .env file for production variables if needed."
echo "To start the app run docker compose up"
echo "Migrations may need to be run, please run the ./scripts/migrate.sh script when available"
