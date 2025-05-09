.PHONY: docs docs-serve clean

# Create virtual environment if it doesn't exist
.venv:
	uv venv

# Install dependencies in development mode
install: .venv
	source .venv/bin/activate && uv pip install -e ".[docs]"

# Build the documentation
docs: install
	source .venv/bin/activate && mkdocs build

# Serve the documentation locally
docs-serve: install
	source .venv/bin/activate && mkdocs serve

# Clean build artifacts
clean:
	rm -rf site/
	rm -rf .venv/
