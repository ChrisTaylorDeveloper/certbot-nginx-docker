#!/bin/bash

docker volume rm $(docker volume ls -q)
docker compose build --no-cache
docker compose up
