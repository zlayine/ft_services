#!/bin/bash
clear

./srcs/docker_builds.sh
echo -e "\033[1;32mCreating Pods..\033[0m"

kubectl create -k ./srcs &> /dev/null

echo -e "\033[1;32mInitializing Pods..\033[0m"
sleep 3
echo -ne '###                 \033[1;34m(33%)\033[0m\r'
sleep 3
echo -ne '#########           \033[1;34m(50%)\033[0m\r'
sleep 3
echo -ne '############        \033[1;34m(67%)\033[0m\r'
sleep 3
echo -ne '################    \033[1;34m(100%)\033[0m\r'
sleep 1
echo -e "                                   "

./srcs/display.sh

#kubectl proxy 