# OpenTelemetry Demo on Kubernetes with Dynatrace Operator



## Quickstart

1- Create KinD cluster

```bash
./src/scripts/00-create-kind-cluster.sh
```

2- Install OTel Operator & Dynatrace Operator

* Collector latest version: [0.128.8](https://github.com/open-telemetry/opentelemetry-collector/releases/tag/v0.128.0)
* Operator latest version: [0.127.0](https://github.com/open-telemetry/opentelemetry-operator/releases/tag/v0.127.0)

```bash
./src/scripts/01-install-otel-operator.sh
./src/scripts/02-install-dt-operator.sh
```

3- Deploy the OTel Demo

```bash
./src/scripts/03-deploy-resources.sh
```