#!/bin/bash

docker compose down --remove-orphans
docker compose down --remove-orphans
docker volume rm --force letsencrypt-docker_certbot_conf
docker volume rm --force letsencrypt-docker_certbot_www
docker compose up --build -d nginx
# ngix should be running OK
docker compose ps
docker compose exec nginx rm -rf /etc/letsencrypt/live/editions.christaylordeveloper.co.uk/
docker compose run --build certbot
