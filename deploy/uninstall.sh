#!/bin/sh
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

kubectl delete -f ${BASE_DIR}/node.yaml
kubectl delete -f ${BASE_DIR}/controller.yaml
kubectl delete -f ${BASE_DIR}/driverinfo.yaml
kubectl delete -f ${BASE_DIR}/rbac.yaml
kubectl delete -f ${BASE_DIR}/secret.yaml

#kubectl delete secret qsan-auth-secret -n qsan
#kubectl delete ns qsan

if kubectl get node --show-labels | grep -q topology.qsan.com/fc; then
	kubectl label nodes --all topology.qsan.com/fc-
fi

if kubectl get node --show-labels | grep -q topology.qsan.com/model; then
	kubectl label nodes --all topology.qsan.com/model-
fi
