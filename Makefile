all: build

build:
	@rm -rf dist
	@poetry build

format:
	@poetry run black .

lint:
	@poetry run pylint ./makenew_serverless_python ./handlers
	@poetry run black --check .

test:
	@poetry run pytest --cov=./makenew_serverless_python

watch:
	@poetry run ptw

version:
	@git add pyproject.toml
	@git commit -m "$$(poetry version -s)"
	@git tag --sign "v$$(poetry version -s)" -m "$(poetry version -s)"

.PHONY: build format lint test watch version
