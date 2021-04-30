
install: repo install-elastic install-kibana

uninstall: delete-elastic delete-kibana clean

repo: 
	@helm repo add elastic https://helm.elastic.co

install-elastic:
	@helm install elasticsearch elastic/elasticsearch -f ./elastic-values.yaml -n logging

delete-elastic:
	@helm delete elasticsearch -n logging

install-kibana:
	@helm install kibana elastic/kibana -f ./kibana-values.yaml -n logging

delete-kibana:
	@helm delete kibana -n logging

clean:
	@kubectl delete namespace logging
