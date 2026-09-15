.PHONY: help up down ps logs

help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make [target]\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  %-10s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

up: ## Start containers and follow logs
	docker compose up -d --build && docker compose logs -f

down: ## Stop and remove containers
	docker compose down

ps: ## Show running containers
	docker compose ps

logs: ## Follow container logs
	docker compose logs -f

default: help