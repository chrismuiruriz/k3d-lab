.PHONY: platform infra

down:
	k3d cluster delete lab

up:
	k3d cluster create lab \
            -p 80:80@loadbalancer \
            -p 443:443@loadbalancer \
            -p 30000-32767:30000-32767@server[0] \
            -v /etc/machine-id:/etc/machine-id:ro \
            -v /var/log/journal:/var/log/journal:ro \
            -v /var/run/docker.sock:/var/run/docker.sock \
            --k3s-server-arg '--no-deploy=traefik' \
            --agents 3
	kubectl taint node k3d-lab-server-0 k3s-controlplane=true:NoSchedule

platform:
	kubectl apply -f platform/ingress/nginx-ingress-deploy.yaml

dashboard:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

corpora:
	kubectl apply -f apps/corpora/k8s/namespace.yaml -f apps/corpora/k8s
