
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

secret:
	@echo "You should replace these values with your own"
	@kubectl create secret docker-registry bryan-dollery-docker-hub \
                    --docker-server="hub.docker.com" \
                    --docker-username="bryandollery" \
                    --docker-password="29bcba23-713c-4472-9918-6f6f7c8d3eea" \
                    --docker-email="bryan.dollery@gmail.com"
