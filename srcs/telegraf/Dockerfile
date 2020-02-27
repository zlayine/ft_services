FROM alpine


RUN apk update && apk add wget
WORKDIR /
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.0-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.13.0-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ 
RUN mkdir /etc/telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT [ "/startup.sh" ]

CMD [ "telegraf" ]