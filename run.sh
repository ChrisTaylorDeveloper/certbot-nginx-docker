#!/bin/bash

# make sure compose is really, really down
docker compose down --remove-orphans
docker compose down --remove-orphans

# make sure no volumes exist
docker volume rm --force letsencrypt-docker_certbot_conf
docker volume rm --force letsencrypt-docker_certbot_www

# start just the nginx service
# copies in fake cert and key (example.com)
docker compose up --build -d nginx

# check ngix should be running OK
docker compose ps

# delete dir of fake certs, otherwise certbot will fail at next step
docker compose exec nginx rm -rf /etc/letsencrypt/live/editions.christaylordeveloper.co.uk/

# run up certbot container too, should get real certs
docker compose run --build certbot
