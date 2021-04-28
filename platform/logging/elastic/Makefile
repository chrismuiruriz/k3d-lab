
install: repo install-elastic install-kibana

uninsall: delete-elastic delete-kibana clean

repo: 
	@helm repo add elastic https://helm.elastic.co

install-elastic:
	@helm install elasticsearch elastic/elasticsearch -f ./elastic-values.yaml -n logging

delete-elastic:
	@helm delete elastic

install-kibana:
	@helm install kibana elastic/kibana -f ./kibana-values.yaml -n logging

delete-kibana:
	@helm delete kibana
