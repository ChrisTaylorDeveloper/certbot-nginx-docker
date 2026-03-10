# LetsEncrypt Docker

Example project.  Intention is to issue LetsEncrypt certificates with Certbot
and Nginx in Docker.

## Instructions

1. You may want to remove all volumes first
`docker volume rm $(docker volume ls -q)`. WARNING! Deletes all volumes on system!
1. `docker compose up --build`
1. See certbot container logs for information regarding your certificate.
