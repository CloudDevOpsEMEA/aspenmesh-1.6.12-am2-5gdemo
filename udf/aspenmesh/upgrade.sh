#!/usr/bin/env bash

helm upgrade istio-base manifests/charts/base --namespace istio-system
helm upgrade istiod manifests/charts/istio-control/istio-discovery --namespace istio-system --values udf/aspenmesh/udf-values.yaml
helm upgrade istio-ingress manifests/charts/gateways/istio-ingress --namespace istio-system --values udf/aspenmesh/udf-values.yaml
helm upgrade istio-egress manifests/charts/gateways/istio-egress --namespace istio-system --values udf/aspenmesh/udf-values.yaml
helm upgrade istio-telemetry manifests/charts/istio-telemetry/grafana --namespace istio-system --values udf/aspenmesh/udf-values.yaml
