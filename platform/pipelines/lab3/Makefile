
install:
	kubectl apply -f pipeline-resource.yaml -f service-account.yaml -f task.yaml -f task-runner.yaml

delete:
	kubectl delete -f pipeline-resource.yaml -f service-account.yaml -f task.yaml -f task-runner.yaml

secret:
	kubectl create secret docker-registry bryan-dollery-docker-hub \
                    --docker-server="hub.docker.com" \
                    --docker-username="bryandollery" \
                    --docker-password="29bcba23-713c-4472-9918-6f6f7c8d3eea" \
                    --docker-email="bryan.dollery@gmail.com"