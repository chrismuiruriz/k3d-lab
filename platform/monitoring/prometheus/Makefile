
install:
	@helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring

repo:
	@helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

delete:
	@helm delete prometheus -n monitoring

