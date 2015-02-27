TAG?=dev

all: build

push: build
	docker push concourse/buildbox-ci:${TAG}

build:
	docker build -t concourse/buildbox-ci:${TAG} .
