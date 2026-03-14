FROM nginx:1.29.2

ARG NGINX_CONF=production
COPY ${NGINX_CONF}.conf /etc/nginx/conf.d/${NGINX_CONF}.conf
