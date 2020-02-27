FROM alpine

WORKDIR /
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
RUN apk update && apk add wget

RUN apk update && apk add --no-cache vsftpd && apk add lftp 
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY startup.sh .
RUN chmod +x /startup.sh

EXPOSE 21 21100

CMD [ "/startup.sh" ]