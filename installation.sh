#!/bin/bash
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    echo "Mac" && \
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 &&\
    sudo install minikube-darwin-amd64 /usr/local/bin/minikube &&\
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl" && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    sudo chown root: /usr/local/bin/kubectl && \
    curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-darwin-amd64 && \
    sudo install skaffold /usr/local/bin && \
    minikube start && \
    kubectl apply -f mysql-pv.yml && \
    skaffold dev --port-forward

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; 
    # Do something under GNU/Linux platform
    then echo "linux" && \
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
    sudo install minikube-linux-amd64 /usr/local/bin/minikube && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
    sudo install skaffold /usr/local/bin/ && \
    minikube start && \
    kubectl apply -f mysql-pv.yml && \
    skaffold dev --port-forward
fi