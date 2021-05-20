
install:
	@kubectl apply -f storage.yaml
	@kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml
	@kubectl apply -f ./generic-tasks/build-and-push.yaml

delete:
	@kubectl delete -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml
