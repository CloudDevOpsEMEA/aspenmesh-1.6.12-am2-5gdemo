#!/usr/bin/env bash

helm install istio-base manifests/charts/base --namespace istio-system
helm install istiod manifests/charts/istio-control/istio-discovery --namespace istio-system --values udf/aspenmesh/udf-values.yaml
helm install istio-ingress manifests/charts/gateways/istio-ingress --namespace istio-system --values udf/aspenmesh/udf-values.yaml
helm install istio-egress manifests/charts/gateways/istio-egress --namespace istio-system --values udf/aspenmesh/udf-values.yaml
helm install istio-telemetry manifests/charts/istio-telemetry/grafana --namespace istio-system --values udf/aspenmesh/udf-values.yaml
