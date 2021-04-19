# NDSOBC

A pair of simple interacting nodejs rest based microservices used to demonstrate fluentbit and logging principles. They don't do much :)

There is a makefile that does almost everything. There is also a docker-compose file used for quick development. The compose file uses a single dockerfile that runs the services using nodemon.

There is also a k8s directory within each microservice that allows you to run these services in kubernetes.
