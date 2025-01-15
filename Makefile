.PHONY: lint format test build fix install-dev install update-assets clean

lint:
	ruff check src tests

format:
	ruff format src tests
	ruff check --fix src tests

fix: format

test:
	pytest tests -v --cov=mc_assets --cov-report=xml

build:
	python -m build .

install-dev:
	pip install -e ".[dev]" 

install:
	pip install .

update-assets:
	./update-assets.sh

clean:
	rm -rf build/ dist/ *.egg-info/ .pytest_cache/ __pycache__/ .ruff_cache/ .coverage coverage.xml
