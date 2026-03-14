#!/bin/bash

# Start with no services.
docker compose down --remove-orphans

# Make sure no volumes exist.
docker volume rm --force certbot_conf
docker volume rm --force certbot_www

# Build nginx service with minimal
# conf required to get the certs.
docker compose build --build-arg NGINX_CONF=certs-issue nginx

docker compose up -d nginx

# Check ngix, is running OK.
docker compose ps

# Now add in certbot. Should try a dry run certs issue.
docker compose run --build certbot

# Restart nginx.
# docker compose restart nginx

# Check if domain has TLS
# sleep 5
# curl https://edition.christaylordeveloper.co.uk
