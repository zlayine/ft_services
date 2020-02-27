#!/bin/bash

clear
echo "--------------------------------"
echo -e "             \033[1;32mPODS\033[0m"
echo "--------------------------------"
kubectl get pods -o wide
echo "--------------------------------"
echo -e "            \033[1;32mSERVICES\033[0m"
echo "--------------------------------"
kubectl get svc -o wide
echo "--------------------------------"
echo -e "               \033[1;32mPV\033[0m"
echo "--------------------------------"
kubectl get pv -o wide
echo "--------------------------------"
echo -e "              \033[1;32mPVC\033[0m"
echo "--------------------------------"
kubectl get pvc -o wide
echo "--------------------------------"
echo -e "           \033[1;32mINGRESS\033[0m"
echo "--------------------------------"
kubectl get ingress
echo "--------------------------------"
echo -e "           \033[1;32mINFO\033[0m"
echo "--------------------------------"
echo -e "\033[1;32mHomepage :\033[0m http://$(minikube ip)/\n"
echo -e "\033[1;32mSSH :\033[0m root:root IP:$(minikube ip) Port:2000\n"
echo -e "\033[1;32mFTP :\033[0m admin:admin IP:$(minikube ip) Port:21\n"