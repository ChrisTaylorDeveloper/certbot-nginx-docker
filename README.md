# LetsEncrypt Docker

Example project.  Intention is to issue LetsEncrypt certificates with Certbot and Nginx in Docker.

```shell
docker run -it --rm \
    -v "/home/chris/Desktop/digital-ocean.ini:/tmp/digital-ocean.ini" \
    -v "/home/chris/Desktop/certs:/etc/letsencrypt/live" \
    certbot/dns-digitalocean certonly \
    --dns-digitalocean --dns-digitalocean-credentials /tmp/digital-ocean.ini \
    --dry-run -d jersey.christaylordeveloper.co.uk
```
