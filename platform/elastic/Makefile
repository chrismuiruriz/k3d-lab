
install: namespace repo install-elastic install-kibana

uninsall: delete-elastic delete-kibana clean

namespace:
	kubectl apply -f namespace.yaml

repo: 
	helm repo add elastic https://helm.elastic.co
	helm repo update

install-elastic:
	helm install elasticsearch elastic/elasticsearch -f ./elastic-values.yaml

delete-elastic:
	helm delete elastic

install-kibana:
	helm install kibana elastic/kibana -f ./kibana-values.yaml

delete-kibana:
	helm delete kibana

clean:
	kubectl delete -f namespace.yaml
