#!/bin/bash
set -e
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install --values "./loki-monolith/values.yaml" loki grafana/loki
oc new-app redis ALLOW_EMPTY_PASSWORD=yes
helm install loki-parser ./loki-parser --values "./loki-parser/values.yaml"
