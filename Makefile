# Default target
.PHONY: all
all: help

# Install dependencies using Poetry
.PHONY: install
install: ## Install dependencies using Poetry
	@uv install
	@uv run pre-commit install
	@jupyter labextension enable juvio-frontend

# Run tests
.PHONY: tests
tests: ## Run tests
	@uv run pytest

# Help
.PHONY: help
help: ## Display this help message
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*## "}; /^[a-zA-Z0-9_-]+:.*## / {printf "  %-12s - %s\n", $$1, $$2}' $(MAKEFILE_LIST)
