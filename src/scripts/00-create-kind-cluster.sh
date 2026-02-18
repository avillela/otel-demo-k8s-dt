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

# Workaround for running KinD in a dev container (might be fixed by now)
docker network create -d=bridge -o com.docker.network.bridge.enable_ip_masquerade=true -o com.docker.network.driver.mtu=1500 --subnet fc00:f853:ccd:e793::/64 kind

kind create cluster --name $K8S_CLUSTER_NAME

# kind delete clusters otel-demo