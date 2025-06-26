#! /bin/bash

# Pass in the name of the .env file
ENVFILE=$1

# Load environment variables from .env file
if [[ -n "${ENVFILE}" && -f ${ENVFILE} ]]; then
  echo "*** Loading environment variables from .env..."
  export $(grep -v '^#' ${ENVFILE} | xargs)
  echo "Environment variables loaded."
else
  echo "*** No ${ENVFILE} file found in the current directory."
  exit 1
fi

kubectl apply -f src/k8s/namespace.yaml
kubectl -n dynatrace create secret generic otel-collector-secret --from-literal="DT_TOKEN=$DT_OTEL_TOKEN" --from-literal="DT_ENV=$DT_URL"
# kubectl apply -f src/k8s/otel-collector-secret-dt.yaml
kubectl apply -f src/k8s/otel-collector-rbac.yaml
kubectl apply -f src/k8s/ta-rbac.yaml
kubectl apply -f src/k8s/otel-collector-dt.yaml
kubectl apply --server-side --force-conflicts -f src/k8s/otel-demo.yaml
