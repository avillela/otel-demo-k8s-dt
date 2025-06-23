#! /bin/bash

#### Deploy the Dynatrace Operator
helm upgrade dynatrace-operator oci://public.ecr.aws/dynatrace/dynatrace-operator \
  --version 1.5.1 \
  --create-namespace --namespace dynatrace \
  --install \
  --atomic
kubectl -n dynatrace wait pod --for=condition=ready --selector=app.kubernetes.io/name=dynatrace-operator,app.kubernetes.io/component=webhook --timeout=300s
kubectl -n dynatrace create secret generic dynakube --from-literal="apiToken=$DTOPERATORTOKEN" --from-literal="dataIngestToken=$DTTOKEN"
sed -i '' "s,TENANTURL_TOREPLACE,$DTURL," dynatrace/dynakube.yaml
sed -i '' "s,CLUSTER_NAME_TO_REPLACE,$CLUSTERNAME,"  dynatrace/dynakube.yaml

### Update the ip of the ip adress for the ingres
#TODO to update this part to create the various Gateway rules
# sed -i '' "s,IP_TO_REPLACE,$IP," opentelemetry/deploy_1_12.yaml