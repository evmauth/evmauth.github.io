.PHONY: docs docs-serve clean

# Create virtual environment if it doesn't exist
.venv:
	uv venv

# Install dependencies in development mode
install: .venv
	uv pip install -e ".[docs]"

# Build the documentation
build: install
	uv run mkdocs build

# Serve the documentation locally
serve: install
	uv run mkdocs serve

# Deploy docs to Github
deploy: install
	uv run mkdocs gh-deploy

# Clean build artifacts
clean:
	rm -rf site/
	rm -rf .venv/

