.PHONY: platform infra

up: k3d platform corpora

k3d:
	k3d cluster create lab --config k3d-config.yaml
	kubectl taint node k3d-lab-server-0 k3s-controlplane=true:NoSchedule

down:
	k3d cluster delete lab

platform:
	make -C platform install

dashboard:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

corpora:
	@make -C apps/corpora/k8s

go:
	make -C infra/tf go
