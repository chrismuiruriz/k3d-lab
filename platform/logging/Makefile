

install:
	kubectl apply -f namespace.yaml
	@make -C elastic install
	@make -C fluentbit install

delete:
	@make -C fluentbit delete
	@make -C elastic delete
	kubectl delete -f namespace.yaml


