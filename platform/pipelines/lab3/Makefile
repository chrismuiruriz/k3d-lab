
clean: delete-secret delete

cycle: clean install

install: secret install-tasks status logs

install-tasks:
	@kubectl apply -f service-account.yaml -f pipeline-resource.yaml -f task.yaml -f task-runner.yaml

delete:
	@kubectl delete -f service-account.yaml -f pipeline-resource.yaml -f task.yaml -f task-runner.yaml

status: 
	@kubectl tkn tr describe build-corpora-image-from-git-source-task-run

desct: 
	@kubectl tkn task describe build-corpora-docker-image-from-git-source

logs:
	@kubectl tkn taskrun logs -f build-corpora-image-from-git-source-task-run

secret: check-DOCKER_USER check-DOCKER_PASSWORD
	@kubectl create secret docker-registry docker-hub \
		--docker-server="https://index.docker.io/v1/" \
		--docker-username=$$DOCKER_USER \
		--docker-password=$$DOCKER_PASSWORD
	@kubectl annotate secret docker-hub tekton.dev/docker-0=index.docker.io

delete-secret: 
	@kubectl delete secret docker-hub

check-%:
	@if [ "${${*}}" = "" ]; then \
        echo "Environment variable $* is not set. Needed to access docker-hub."; \
        exit 1; \
  fi