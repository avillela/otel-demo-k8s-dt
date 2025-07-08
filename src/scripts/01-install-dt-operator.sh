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


#### Deploy the Dynatrace Operator
helm upgrade dynatrace-operator oci://public.ecr.aws/dynatrace/dynatrace-operator \
  --version 1.5.1 \
  --create-namespace --namespace dynatrace \
  --install \
  --atomic
kubectl -n dynatrace wait pod --for=condition=ready --selector=app.kubernetes.io/name=dynatrace-operator,app.kubernetes.io/component=webhook --timeout=300s
kubectl -n dynatrace create secret generic dynakube-secret --from-literal="apiToken=$DT_OPERATOR_TOKEN" --from-literal="dataIngestToken=$DT_OTEL_TOKEN"

echo "*** Running envsubst"
envsubst \
    < src/k8s/dynakube.template.yaml \
    > src/k8s/dynakube.yaml

echo "envsubst completed."


#### Deploy DynaKube resource
kubectl apply -f src/k8s/dynakube.yaml