#!/bin/bash
cd kubernetes

kubectl create ns project

kubectl apply -f nginx-conf.yaml

kubectl apply -f frontend-app.yaml

kubectl apply -f frontend-cip.yaml

kubectl apply -f backend-app.yaml

kubectl apply -f backend-cip.yaml

kubectl apply -f nginx.yaml

kubectl apply -f nginx-lb.yaml