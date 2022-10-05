#!/bin/bash
cd kubernetes
kubectl apply -f frontend.yaml
kubectl apply -f backend.yaml
kubectl apply -f configmap.yaml
kubectl apply -f nginx.yaml
sleep 20s
kubectl get services