SHELL := /bin/bash

cluster.opendistro.build:
	docker-compose --project-directory .ci/opendistro build;

cluster.opendistro.start:
	docker-compose --project-directory .ci/opendistro up -d ;
	sleep 20;

cluster.opendistro.stop:
	docker-compose --project-directory .ci/opendistro down ;

cluster.clean: ## Remove unused Docker volumes and networks
	@printf "\033[2m→ Cleaning up Docker assets...\033[0m\n"
	docker volume prune --force
	docker network prune --force
	docker system prune --volumes --force




workflow: ## Run all github workflow commands here sequentially

# Lint
	make lint
# License Checker
	.github/check-license-headers.sh
# Unit Test
	make test-unit race=true
# Benchmarks Test
	make test-bench
# Integration Test
### OpenDistro
	make cluster.clean cluster.opendistro.build cluster.opendistro.start
	make test-integ race=true
	make cluster.opendistro.stop

##@ Other
#------------------------------------------------------------------------------
help:  ## Display help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
#------------- <https://suva.sh/posts/well-documented-makefiles> --------------

.DEFAULT_GOAL := help
.PHONY: help backport cluster cluster.opendistro.build cluster.opendistro.start cluster.opendistro.stop cluster.clean coverage  godoc lint release test test-bench test-integ test-unit
