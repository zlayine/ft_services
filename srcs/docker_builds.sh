#!/bin/bash
eval $(minikube -p minikube docker-env)
echo -e "\033[1;32mBuilding images..\033[0m"
echo -ne '##                       \033[1;34m(NGINX)\033[0m\r'
docker build -t my-nginx srcs/nginx/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '#####                    \033[1;34m(WORDPRESS)\033[0m\r'
docker build -t my-wp srcs/wordpress/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '########                 \033[1;34m(INFLUXDB)\033[0m\r'
docker build -t my-influx srcs/influx/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '###########              \033[1;34m(PHPMYADMIN)\033[0m\r'
docker build -t my-admin srcs/phpmyadmin/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '#############            \033[1;34m(MYSQL)\033[0m\r'
docker build -t mysql-image srcs/mysql/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '################         \033[1;34m(GRAFANA)\033[0m\r'
docker build -t my-grafana srcs/grafana/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '####################     \033[1;34m(FTPS)\033[0m\r'
docker build -t my-ftps srcs/ftps/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '######################   \033[1;34m(TELEGRAF)\033[0m\r'
docker build -t my-telegraf srcs/telegraf/  &> /dev/null
echo -ne '                                                   \r'
echo -ne '##########################                      \r'

echo -e "\033[1;32mImages built successfully..\033[0m"
