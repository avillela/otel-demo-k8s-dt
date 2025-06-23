#! /bin/bash

kubectl apply -f src/k8s/otel-demo.yaml
kubectl apply -f src/k8s/dynakube.yaml