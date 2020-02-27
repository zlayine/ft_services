#!/bin/bash
echo -e "\033[1;32mCreating volumes..\033[0m"
kubectl create -f srcs/volumes &> /dev/null

echo -e "\033[1;32mSetuping environment..\033[0m"
kubectl config use-context minikube &> /dev/null
minikube addons enable ingress &> /dev/null
minikube addons enable metrics-server &> /dev/null
minikube addons enable dashboard &> /dev/null

echo -e "\033[1;32mCreating secrets..\033[0m"
kubectl create secret generic ip-secret --from-literal=ip=$(minikube ip) &> /dev/null
#kubectl create secret generic mysql-secret --from-literal=password=abc123 > /dev/null
#kubectl create configmap telegraf-config --from-file=srcs/telegraf/telegraf.conf > /dev/null
#kubectl create secret tls my-secret --cert=srcs/tls-keys/tls.crt --key=srcs/tls-keys/tls.key > /dev/null
#kubectl create secret generic token-secret --from-literal=token=$(kubectl get secrets -n kubernetes-dashboard -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='kubernetes-dashboard')].data.token}"|base64 --decode) > /dev/null
clear