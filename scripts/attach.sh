name=$(docker ps --filter name=template-app-1 --format "{{.Names}}")
docker attach $name
