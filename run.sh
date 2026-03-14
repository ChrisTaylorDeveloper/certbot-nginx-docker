#!/bin/bash

# Start with no services.
docker compose down --remove-orphans

# Make sure no volumes exist.
docker volume rm --force certbot_conf
docker volume rm --force certbot_www

# Build nginx service with minimal
# conf required to get the certs.
docker compose build --build-arg NGINX_CONF=certs-issue nginx

# Start nginx service.
docker compose up -d nginx

# Now ask certbot to get certs. Remove --dry-run !
docker compose run --build --rm certbot certonly --dry-run --webroot -w /var/www/certbot --force-renewal --email chris@christaylordeveloper.co.uk -d edition.christaylordeveloper.co.uk --agree-tos --no-eff-email

# Build nginx service again but this
# time with the production conf.
docker compose build --build-arg NGINX_CONF=production nginx

# Start nginx.
docker compose up -d nginx

# Check if domain has TLS
# sleep 5
# curl https://edition.christaylordeveloper.co.uk
