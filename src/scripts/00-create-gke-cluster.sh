#!/bin/bash

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

echo "GCP project: ${GCP_PROJECT_NAME}"
echo "GCP zone: ${GCP_ZONE}"
echo "GCP cluste name: ${K8S_CLUSTER_NAME}"

# gcloud setup
gcloud auth login
gcloud config set project ${GCP_PROJECT_NAME}
# gcloud auth application-default login
# gcloud compute zones list

# Create GKE cluster
gcloud container clusters create "${K8S_CLUSTER_NAME}" \
  --zone ${GCP_ZONE} \
  --machine-type=${GKE_MACHINE_TYPE} \
  --num-nodes=1 \
  --monitoring=NONE --logging=NONE

# Delete cluster
# gcloud container clusters delete ${GKE_CLUSTER_NAME} --zone=${GCP_ZONE}
