
install:
	@kubectl apply -f pipeline-resource.yaml -f task.yaml -f task-runner.yaml

delete:
	@kubectl delete -f pipeline-resource.yaml -f task.yaml -f task-runner.yaml

desctr: 
	@kubectl tkn tr describe build-corpora-image-from-git-source-task-run

desct: 
	@kubectl tkn task describe build-corpora-docker-image-from-git-source

logs:
	@kubectl tkn taskrun logs build-corpora-image-from-git-source-task-run

