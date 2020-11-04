#!/usr/bin/env bash

helm uninstall istio-base --namespace istio-system
helm uninstall istiod --namespace istio-system
helm uninstall istio-ingress --namespace istio-system
helm uninstall istio-egress --namespace istio-system
# helm uninstall istio-telemetry --namespace istio-system

kubectl delete namespace istio-system
