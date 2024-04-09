include $(PWD)/.env
export

.DEFAULT_GOAL := help
.PHONY: help

# Internal variables:
ENABLE_DOCKER_BUILDKIT := DOCKER_BUILDKIT=1
ENV_FILE := --env-file $(PWD)/.env

# Available commands:
help:
	@grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "[32m%-27s[0m %s\n", $$1, $$2}'

build: ## Building pihole and unbound images.
	@$(ENABLE_DOCKER_BUILDKIT) docker build --tag $(PROJECT)/pihole:$(TAG) --target pihole .
	@$(ENABLE_DOCKER_BUILDKIT) docker build --tag $(PROJECT)/unbound:$(TAG) --target unbound .

start: ## Start containers.
	@docker-compose $(ENV_FILE) up -d

stop: ## Stop and remove containers.
	@docker-compose $(ENV_FILE) down -v

shell: ## Get root shell inside pihole container.
	@docker-compose exec -u root pihole /bin/bash
