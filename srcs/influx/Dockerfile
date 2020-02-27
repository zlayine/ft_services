FROM alpine

RUN apk update && apk add influxdb
RUN mkdir /etc/influxdb

WORKDIR /
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh


COPY startup.sh .
COPY influxdb.conf /etc/influxdb/influxdb.conf
RUN chmod +x startup.sh

EXPOSE 8086

CMD [ "/startup.sh" ]