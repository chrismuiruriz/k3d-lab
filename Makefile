.PHONY: platform infra apps

up: init k3d platform apps

init:
	@mkdir -p /tmp/volumes/k3d0
	@mkdir -p /tmp/volumes/k3d1
	@mkdir -p /tmp/volumes/k3d2
	@mkdir -p /tmp/volumes/k3d

k3d:
	k3d cluster create lab --config k3d-config.yaml
	kubectl taint node k3d-lab-server-0 k3s-controlplane=true:NoSchedule

down:
	k3d cluster delete lab

platform:
	make -C platform install

dashboard:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

apps:
	@make -C apps install

go:
	make -C infra/tf go
