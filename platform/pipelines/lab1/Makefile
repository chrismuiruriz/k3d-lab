
t:
	@kubectl apply -f task.yaml

tr:
	@kubectl apply -f taskRunner.yaml

desct:
	@kubectl tkn task describe echo-hello-world

desctr:
	@kubectl tkn taskrun describe echo-hello-world-task-run

logstr:
	@kubectl tkn taskrun logs echo-hello-world-task-run

delete:
	@kubectl delete -f .
