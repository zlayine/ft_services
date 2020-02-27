FROM wordpress:php7.4-fpm-alpine

RUN apk add nginx
COPY ./default.conf /etc/nginx/conf.d
RUN mkdir -p /run/nginx

WORKDIR /var/www/html/wordpress

EXPOSE 80

CMD /usr/sbin/nginx && /usr/local/bin/docker-entrypoint.sh php-fpm