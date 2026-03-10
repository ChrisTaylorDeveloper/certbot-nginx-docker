#!/bin/bash

docker compose down --remove-orphans
docker compose down --remove-orphans
git pull
docker volume rm --force letsencrypt-docker_certbot_conf
docker volume rm --force letsencrypt-docker_certbot_www
docker compose up --build -d nginx
docker compose ps
docker compose run --build certbot
