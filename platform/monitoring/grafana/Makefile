
install: install-grafana wait password

install-grafana:
	@helm install grafana grafana/grafana -f values.yaml -n monitoring

cycle: delete install

wait:
	@sleep 5

password:
	@echo "4. Password "
	@kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

delete:
	@helm delete grafana

repo:
	@helm repo add grafana https://grafana.github.io/helm-charts
