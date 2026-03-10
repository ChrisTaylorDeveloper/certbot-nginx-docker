#!/bin/bash

docker compose down --remove-orphans
docker compose down --remove-orphans
docker volume rm $(docker volume ls -q)
docker compose build --no-cache
docker compose up
