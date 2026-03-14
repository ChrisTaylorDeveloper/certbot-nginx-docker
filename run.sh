#!/bin/bash

# Start with no services.
docker compose down --remove-orphans

# Make sure no volumes exist.
docker volume rm --force certbot_conf
docker volume rm --force certbot_www

# Build nginx service with minimal
# conf required to get the certs.
docker compose build --build-arg NGINX_CONF=certs-issue nginx

# Start nginx service first.
docker compose up -d nginx

# Now ask certbot to get certs. Could also try --dry-run
docker compose run --build --rm certbot certonly --webroot -w /var/www/certbot --force-renewal --email chris@christaylordeveloper.co.uk -d edition.christaylordeveloper.co.uk --agree-tos --no-eff-email

# Restart nginx.
# docker compose restart nginx

# Check if domain has TLS
# sleep 5
# curl https://edition.christaylordeveloper.co.uk
