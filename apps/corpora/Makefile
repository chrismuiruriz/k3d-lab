install: build release deploy test

build:
	docker build --tag bryandollery/corpora .

run:
	docker run -d --name corpora -p 8080:80 bryandollery/corpora

release:
	docker push bryandollery/corpora

deploy:
	kubectl -n corpora apply -f ./k8s

delete:
	kubectl -n corpora delete -f ./k8s

test:
	@echo "Running tests -- may take a few seconds"
	@./test.sh > /dev/null
	@echo "Passed"
