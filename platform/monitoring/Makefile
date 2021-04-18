
default: create-namespace

install: create-namespace install-prometheus install-grafana

delete: delete-grafana delete-prometheus delete-namespace

create-namespace:
	@kubectl apply -f namespace.yaml

delete-namespace:
	@kubectl delete -f namespace.yaml

install-prometheus:
	@make -C prometheus install

delete-prometheus:
	@make -c prometheus delete

install-grafana:
	@make -C grafana install

delete-grafana:
	@make -C grafana delete
