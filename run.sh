#!/bin/bash

# Clean up from previous run.
docker compose down --remove-orphans
docker volume rm --force certbot_conf
docker volume rm --force certbot_www

# Build and run up nginx service, with
# minimal conf required to get the certs.
docker compose build --build-arg NGINX_CONF=certs-issue nginx
docker compose up -d nginx

# Now ask certbot to get certs.
docker compose run --build --rm certbot certonly --webroot -w /var/www/certbot --force-renewal --email chris@christaylordeveloper.co.uk -d edition.christaylordeveloper.co.uk --agree-tos --no-eff-email

# Build and run nginx service again but
# this time with the production conf file.
docker compose build --build-arg NGINX_CONF=production nginx
docker compose up -d nginx

sleep 6

# Should get a 301.
curl --head http://edition.christaylordeveloper.co.uk

# Should be fine.
curl https://edition.christaylordeveloper.co.uk
