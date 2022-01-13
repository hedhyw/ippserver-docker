export IPPSERVER_VER?=0.2
export PIP_VER?=21.3.1
export PYTHON_VER?=3.9.9-slim-buster
export DOCKER_TAG?=0.2
export DOCKER_IMAGE:=hedhyw/ippserver

all: build build.latest publish publish.latest

build:
	docker build . \
		--tag $(DOCKER_IMAGE):$(DOCKER_TAG) \
		--build-arg IPPSERVER_VER=$(IPPSERVER_VER) \
		--build-arg PIP_VER=$(PIP_VER) \
		--build-arg PYTHON_VER=$(PYTHON_VER)
.PHONY: build

build.latest: export DOCKER_TAG=latest
build.latest: build
.PHONY: build.latest

publish:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
.PHONY: publish

publish.latest: export DOCKER_TAG=latest
publish.latest: publish
.PHONY: publish.latest
