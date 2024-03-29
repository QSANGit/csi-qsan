#!/bin/sh
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

if kubectl get node --show-labels | grep -q topology.qsan.com/fc; then
	kubectl label nodes --all topology.qsan.com/fc-
fi

if kubectl get node --show-labels | grep -q topology.qsan.com/model; then
	kubectl label nodes --all topology.qsan.com/model-
fi

kubectl create ns qsan
kubectl create secret -n qsan generic qsan-auth-secret --from-file=${BASE_DIR}/qsan-auth.yaml

kubectl apply -f ${BASE_DIR}/rbac.yaml
kubectl apply -f ${BASE_DIR}/driverinfo.yaml
kubectl apply -f ${BASE_DIR}/controller.yaml
kubectl apply -f ${BASE_DIR}/node.yaml

