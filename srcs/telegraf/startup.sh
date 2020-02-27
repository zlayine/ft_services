#!/bin/sh

URL=$MINIKUBE_IP
sed -ri "s/URL_HERE/$URL/g" /etc/telegraf/telegraf.conf

exec "$@"