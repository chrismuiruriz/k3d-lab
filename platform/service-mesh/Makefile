
install:
	@helm install -f config2.yaml consul hashicorp/consul -n service-mesh

delete:
	@helm delete consul -n service-mesh

repo:
	@helm repo add hashicorp https://helm.releases.hashicorp.com

pods:
	@kubectl get pods --selector app=consul
