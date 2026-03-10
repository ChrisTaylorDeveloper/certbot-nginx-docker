FROM nginx:1.29.2

COPY fake-chain.pem /etc/letsencrypt/live/edition.christaylordeveloper.co.uk/fullchain.pem
COPY fake-key.pem /etc/letsencrypt/live/edition.christaylordeveloper.co.uk/privkey.pem
COPY acme-challenge.conf /etc/nginx/conf.d/acme-challenge.conf
