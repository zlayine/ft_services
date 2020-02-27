FROM nginx:alpine

RUN chmod 777 -R /var

WORKDIR /
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

RUN apk add openssh
COPY sshd_config /etc/ssh/sshd_config
RUN DEBIAN_FRONTEND=noninteractive /usr/bin/ssh-keygen -A && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key
RUN echo "root:root" | chpasswd
RUN rm -rf /var/empty && cd /var && mkdir empty

WORKDIR /var/www/html
COPY ./nginx.conf /etc/nginx/
COPY ./index.html .
RUN mkdir imgs
COPY ./imgs ./imgs
RUN chmod 777 ./imgs/*

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT [ "/startup.sh" ]

CMD ["nginx", "-g", "daemon off;"]