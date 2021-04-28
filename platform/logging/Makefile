
install: repo namespace install-all

repo:
	@make -C elastic repo
	@make -C fluentbit repo
	@helm repo update

namespace: 
	kubectl apply -f namespace.yaml

install-all:
	@make -C elastic install
	@make -C fluentbit install

delete:
	@make -C fluentbit delete
	@make -C elastic delete
	kubectl delete -f namespace.yaml
