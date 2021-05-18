
clean: delete delete-secret

cycle: clean install

install: secret install-tasks status 

install-tasks:
	@kubectl apply -f service-account.yaml -f pipeline-resource.yaml -f task.yaml -f task-runner.yaml

delete:
	@kubectl delete -f service-account.yaml -f pipeline-resource.yaml -f task.yaml -f task-runner.yaml

status: 
	@kubectl tkn tr describe build-corpora-image-from-git-source-task-run

desct: 
	@kubectl tkn task describe build-corpora-docker-image-from-git-source

logs:
	@kubectl tkn taskrun logs build-corpora-image-from-git-source-task-run

secret:
	@echo "You should replace these values with your own"
	kubectl create secret docker-registry bryan-dollery-docker-hub \
		--docker-server="index.docker.io" \
        --docker-username="bryandollery" \
        --docker-password=$$DPWD \
        --docker-email="bryan.dollery@gmail.com"
	@kubectl annotate secret bryan-dollery-docker-hub tekton.dev/docker-0=https://index.docker.io

delete-secret: 
	@kubectl delete secret bryan-dollery-docker-hub

