FROM alpine:latest

ENV SERVICE=mysql
RUN apk add mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

RUN apk update && apk add wget

WORKDIR /app
VOLUME /app

EXPOSE 3306

CMD ["/startup.sh"]
