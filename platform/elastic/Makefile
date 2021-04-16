
install:
	kubectl apply -f namespace.yaml
	helm repo update
	helm install elasticsearch elastic/elasticsearch -f ./values.yaml
	helm install kibana elastic/kibana -f ./values.yaml
