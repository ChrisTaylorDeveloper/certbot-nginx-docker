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
docker compose run --build --rm certbot \
  certonly --dry-run --webroot -w /var/www/certbot --force-renewal --email chris@christaylordeveloper.co.uk -d edition.christaylordeveloper.co.uk --agree-tos --no-eff-email

# Restart nginx.
# docker compose restart nginx

# Check if domain has TLS
# sleep 5
# curl https://edition.christaylordeveloper.co.uk
