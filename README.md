# OpenTelemetry Demo on Kubernetes with Dynatrace Operator



## Quickstart

1- Make a copy of the .env file

This file is version controlled and contains environment variables for secrets, so make a copy and call it secrets.env, since that is in .gitignore.

```bash
cp .env secrets.env
```

2- Create Kubernetes cluster

This will create a Kubernetes cluster in Google Cloud.

```bash
./src/scripts/00-create-gke-cluster.sh secrets.env
```

3- Install OTel Operator & Dynatrace Operator

Installs the Dynatrace Operator and DynaKube resource first, before installing the OTel Operator.

DynaKube should be installed before deploying the OTel Demo, since it injects an init-container inside the OTel Operator pod.

```bash
./src/scripts/01-install-dt-operator.sh secrets.env
./src/scripts/02-install-otel-operator.sh
```

4- Deploy the OTel Demo

DynaKube should be installed before deploying the OTel Demo, since it injects an init-container inside the OTel Demo pods.

```bash
./src/scripts/03-deploy-resources.sh
```

