#! /bin/bash

# Pull images locally
docker pull ghcr.io/open-telemetry/demo:2.0.2-accounting
docker pull ghcr.io/open-telemetry/demo:2.0.2-ad
docker pull ghcr.io/open-telemetry/demo:2.0.2-cart
docker pull ghcr.io/open-telemetry/demo:2.0.2-checkout
docker pull ghcr.io/open-telemetry/demo:2.0.2-currency
docker pull ghcr.io/open-telemetry/demo:2.0.2-email
docker pull ghcr.io/open-feature/flagd:v0.11.1
docker pull ghcr.io/open-telemetry/demo:2.0.2-flagd-ui
docker pull ghcr.io/open-telemetry/demo:2.0.2-fraud-detection
docker pull ghcr.io/open-telemetry/demo:2.0.2-frontend
docker pull ghcr.io/open-telemetry/demo:2.0.2-frontend-proxy
docker pull ghcr.io/open-telemetry/demo:2.0.2-image-provider
docker pull ghcr.io/open-telemetry/demo:2.0.2-kafka
docker pull ghcr.io/open-telemetry/demo:2.0.2-load-generator
docker pull ghcr.io/open-telemetry/demo:2.0.2-payment
docker pull ghcr.io/open-telemetry/demo:2.0.2-product-catalog
docker pull ghcr.io/open-telemetry/demo:2.0.2-quote
docker pull ghcr.io/open-telemetry/demo:2.0.2-recommendation
docker pull ghcr.io/open-telemetry/demo:2.0.2-shipping
docker pull jaegertracing/all-in-one:1.53.0
docker pull docker.io/grafana/grafana:11.5.2
docker pull quay.io/prometheus/prometheus:v3.1.0
docker pull opensearchproject/opensearch:2.19.0
docker pull otel/opentelemetry-collector-contrib:0.128.0

# Load images into KinD
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-accounting -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-ad -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-cart -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-checkout -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-currency -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-email -n otel-demo
kind load docker-image ghcr.io/open-feature/flagd:v0.11.1 -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-flagd-ui -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-fraud-detection -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-frontend -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-frontend-proxy -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-image-provider -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-kafka -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-load-generator -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-payment -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-product-catalog -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-quote -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-recommendation -n otel-demo
kind load docker-image ghcr.io/open-telemetry/demo:2.0.2-shipping -n otel-demo
kind load docker-image jaegertracing/all-in-one:1.53.0 -n otel-demo
kind load docker-image docker.io/grafana/grafana:11.5.2 -n otel-demo
kind load docker-image quay.io/prometheus/prometheus:v3.1.0 -n otel-demo
kind load docker-image opensearchproject/opensearch:2.19.0 -n otel-demo
kind load docker-image otel/opentelemetry-collector-contrib:0.128.0 -n otel-demo