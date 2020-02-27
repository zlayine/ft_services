FROM phpmyadmin/phpmyadmin:fpm-alpine

RUN apk add nginx
COPY ./default.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

WORKDIR /var/www/html/phpmyadmin

EXPOSE 80

CMD /usr/sbin/nginx && /docker-entrypoint.sh php-fpm