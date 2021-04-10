.PHONY: platform infra

up: k3d platform corpora

k3d:
	k3d cluster create lab --config k3d-config.yaml
	kubectl taint node k3d-lab-server-0 k3s-controlplane=true:NoSchedule

down:
	k3d cluster delete lab

platform:
	kubectl apply -f platform/ingress/nginx.yaml

dashboard:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

corpora:
	kubectl apply -f apps/corpora/k8s/namespace.yaml -f apps/corpora/k8s/deploy.yaml -f apps/corpora/k8s/service.yaml
	sleep 20
	kubectl apply -f /home/ubuntu/git/k3d-lab/apps/corpora/k8s/ingress.yaml

go:
	make -C infra/tf go
