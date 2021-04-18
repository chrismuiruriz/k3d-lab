
install:
	kubectl apply -f nginx.yaml
	@echo "Waiting for nginx controller pod to be ready"
	kubectl wait $$(kubectl get pods -o name -n ingress-nginx | grep controller) --for=condition=ready --timeout=240s -n ingress-nginx

delete:
	kubectl delete -f nginx.yaml
