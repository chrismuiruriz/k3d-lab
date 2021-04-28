
default: create-namespace

install: create-namespace prometheus-repo grafana-repo update-repo install-prometheus install-grafana

delete: delete-grafana delete-prometheus delete-namespace

create-namespace:
	@kubectl apply -f namespace.yaml

delete-namespace:
	@kubectl delete -f namespace.yaml

install-prometheus:
	@make -C prometheus repo
	@make -C prometheus install

delete-prometheus:
	@make -c prometheus delete

install-grafana:
	@make -C grafana repo
	@make -C grafana install

delete-grafana:
	@make -C grafana delete

update-repo:
	@helm repo update
