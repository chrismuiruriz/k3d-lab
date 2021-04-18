
install: install-grafana wait password

install-grafana:
	@helm install grafana grafana/grafana -f values.yaml -n monitoring

wait:
	@sleep 5

password:
	@kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

delete:
	@helm delete grafana

repo:
	@helm repo add grafana https://grafana.github.io/helm-charts
	@helm repo update
