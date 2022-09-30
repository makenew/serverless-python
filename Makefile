all: lint test build

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

.PHONY: build docs test
