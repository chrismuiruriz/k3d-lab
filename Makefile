.PHONY: platform infra

down:
	k3d cluster delete lab

up:
	k3d cluster create lab --config k3d-config.yaml
	kubectl taint node k3d-lab-server-0 k3s-controlplane=true:NoSchedule

platform:
	kubectl apply -f platform/ingress/nginx-ingress-deploy.yaml

dashboard:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

corpora:
	kubectl apply -f apps/corpora/k8s/namespace.yaml -f apps/corpora/k8s

go:
	make -C infra/tf go
