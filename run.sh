#!/bin/bash

# Make sure compose is really, really down.
docker compose down --remove-orphans
docker compose down --remove-orphans

# Make sure no volumes exist.
docker volume rm --force letsencrypt-docker_certbot_conf
docker volume rm --force letsencrypt-docker_certbot_www

# Start just the nginx service which
# copies in fake cert and key (example.com).
docker compose up --build -d nginx

# Check ngix, should be running OK.
docker compose ps

# Delete dir of fake certs, otherwise certbot will fail at next step.
docker compose exec nginx rm -rf /etc/letsencrypt/live/edition.christaylordeveloper.co.uk/

# Run-up certbot container too, should now get real certs.
docker compose run --build certbot

# Restart nginx.
docker compose restart nginx

# Check if domain has TLS
curl https://edition.christaylordeveloper.co.uk
