#! /bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
  echo "*** Loading environment variables from .env..."
  export $(grep -v '^#' .env | xargs)
  echo "Environment variables loaded."
else
  echo "*** No .env file found in the current directory."
  exit 1
fi


#### Deploy the Dynatrace Operator
helm upgrade dynatrace-operator oci://public.ecr.aws/dynatrace/dynatrace-operator \
  --version 1.5.1 \
  --create-namespace --namespace dynatrace \
  --install \
  --atomic
kubectl -n dynatrace wait pod --for=condition=ready --selector=app.kubernetes.io/name=dynatrace-operator,app.kubernetes.io/component=webhook --timeout=300s
# kubectl -n dynatrace create secret generic dynakube --from-literal="apiToken=$DTOPERATORTOKEN" --from-literal="dataIngestToken=$DTTOKEN"
# sed -i '' "s,TENANTURL_TOREPLACE,$DTURL," dynatrace/dynakube.yaml.template
# sed -i '' "s,CLUSTER_NAME_TO_REPLACE,$CLUSTERNAME,"  dynatrace/dynakube.yaml.template

echo "*** Running envsubst"
envsubst \
    < src/k8s/dynakube.template.yaml \
    > src/k8s/dynakube.yaml

echo "envsubst completed."