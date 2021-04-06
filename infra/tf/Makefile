.PHONY: output plan clean help

up: fmt plan apply

help:
	@echo "syntax: make <target>\nWhere target is: ver, debug, clean, output, up, fmt, plan, apply, copy, ip, connect, init, test\n\nUses terraform to manage a simple k3d and a more complex k3s cluster"

debug:
	docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_debug" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   bryandollery/terraform-packer-aws-alpine:15

ver:
	docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_ver" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 -version

fmt:
	time -p docker container run -it --rm \
		   -v $$PWD:/$$(basename $$PWD) \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_fmt" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 fmt -recursive
validate:
	time -p docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_fmt" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 validate

plan: clean
	time -p docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_plan" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 plan -out plan.out

apply: _apply output.json

_apply:
	time -p docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_apply" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 apply plan.out

down:
	time -p docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_down" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 destroy -auto-approve
	rm -f output.json
	rm -f plan.out

test: copy connect

output.json:
	docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_output" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 output -json > output.json

clean:
	rm -f output.json
	rm -f plan.out

go: pull connect

pull:
	ssh -oStrictHostKeyChecking=no -i ssh/id_rsa ubuntu@$$(cat output.json | jq '.k3d_ip.value' | xargs) cd git/k3d-lab && git pull

ip:
	echo $$(cat output.json | jq '.k3d_ip.value' | xargs)

connect: output.json
	ssh -oStrictHostKeyChecking=no -i ssh/id_rsa ubuntu@$$(cat output.json | jq '.k3d_ip.value' | xargs)

init: clean
	rm -rf .terraform ssh
	mkdir ssh
	ssh-keygen -t rsa -f ./ssh/id_rsa -q -N ""
	time -p docker container run -it --rm \
		   --env TF_NAMESPACE=$$TF_NAMESPACE \
		   --env AWS_PROFILE="labs" \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $$PWD:/$$(basename $$PWD) \
		   -v $$PWD/../../../creds:/.aws \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)_init" \
		   -w /$$(basename $$PWD) \
		   -u $$(id -u):$$(id -g) \
		   --entrypoint terraform \
		   bryandollery/terraform-packer-aws-alpine:15 init

