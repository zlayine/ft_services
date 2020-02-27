#!/bin/bash

echo -e "\033[1;32mChecking Minikube!\033[0m"
if ! $(minikube status &> /dev/null) ; then
    echo -e "\033[1;32mMinikube is not running..Starting minikube\033[0m"
    if ! $(minikube start --vm-driver=virtualbox --memory 3000 --bootstrapper=kubeadm &> /dev/null); then
        echo "Cannot start minikube..exiting"
        exit 1
    fi
    
    if ! $(minikube status &> /dev/null) ; then
        sleep 10
        if ! $(minikube status &> /dev/null) ; then
            echo "Minikube is not running..exiting"
            exit 1
        fi
    fi
    eval $(minikube -p minikube docker-env)
    echo -e "\033[1;32mMinikube Started!\033[0m"
    echo -e "\033[1;32mCreating configs..\033[0m"
    ./srcs/configs.sh
fi


if [ "$1" == "delete" ]
then
   ./srcs/delete.sh
elif [ "$1" == "info" ]
then
    ./srcs/display.sh
elif [ "$1" == "exec" ]
then
    kubectl exec -it $2 sh
else
     ./srcs/run.sh
fi
