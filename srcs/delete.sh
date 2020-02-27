#!/bin/bash
clear
echo -e "\033[1;32mTerminating Pods..\033[0m"
echo -ne '###                 \033[1;34m(33%)\033[0m\r'

kubectl delete -k ./srcs/ &> /dev/null

sleep 3
echo -ne '#########           \033[1;34m(50%)\033[0m\r'
sleep 3
echo -ne '############        \033[1;34m(67%)\033[0m\r'
sleep 3
echo -ne '################    \033[1;34m(100%)\033[0m\r'
sleep 1
echo -e "                                   "
clear
echo  -e "\033[1;32mDONE\033[0m"