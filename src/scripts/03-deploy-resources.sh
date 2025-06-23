#! /bin/bash

kubectl apply -f src/k8s/otel-collector-secret-dt.yaml
kubectl apply -f src/k8s/otel-collector-rbac.yaml
kubectl apply -f src/k8s/ta-rbac.yaml
kubectl apply -f src/k8s/otel-collector-dt.yaml
kubectl apply -f src/k8s/otel-demo.yaml
# kubectl apply -f src/k8s/dynakube.yaml