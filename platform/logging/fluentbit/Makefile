
cycle: delete install

install:
	@kubectl apply -f fluent-bit.yaml

delete:
	@kubectl delete -f fluent-bit.yaml

repo:
	@helm repo add fluent https://fluent.github.io/helm-charts
