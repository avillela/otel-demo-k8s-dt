#! /bin/bash

# Pass in the name of the .env file
ENVFILE=$1

# Load environment variables from .env file
if [[ -n "${ENVFILE}" && -f ${ENVFILE} ]]; then
  echo "*** Loading environment variables from .env..."
  export $(grep -v '^#' ${ENVFILE} | xargs)
  echo "Environment variables loaded."
else
  echo "*** No ${ENVFILE} file found in the current directory. Exiting."
  exit 1
fi

kubectl apply -f src/k8s/namespace.yaml

# Create secret for configuring OTel Collector
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: otel-collector-secret
  namespace: otel-demo
type: Opaque
stringData:
  DT_TOKEN: $DT_API_TOKEN
  DT_ENV: $DT_URL
EOF

kubectl apply -f src/k8s/otel-collector-rbac.yaml
kubectl apply -f src/k8s/ta-rbac.yaml
kubectl apply -f src/k8s/otel-collector-dt.yaml
kubectl apply --server-side --force-conflicts -f src/k8s/otel-demo.yaml
