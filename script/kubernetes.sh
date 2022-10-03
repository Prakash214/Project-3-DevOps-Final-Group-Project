#!/bin/bash
cd kubernetes
kubectl apply -f frontend.yaml
kubectl apply -f backend.yaml
kubectl apply -f nginx.yaml
kubectl get services