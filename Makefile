.DEFAULT_GOAL := help

.PHONY: all build clean help push tag

NAME        = docker-terraform
DOCKER_REPO	= devlware
VERSION     = 0.0.1


all: build tag push

build: ## Builds docker image
	docker build -t=$(NAME):$(VERSION) .

clean: ## Removes the docker container image
	docker rmi $(NAME):$(VERSION)

push: ## Pushes the docker image to Docker Hub
	docker push $(DOCKER_REPO)/$(NAME):$(VERSION)

tag: ## Tags the image
	docker tag $(NAME):$(VERSION) $(DOCKER_REPO)/$(NAME):$(VERSION)

help: ## Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
