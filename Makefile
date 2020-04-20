all: lint test

build:
	@rm -rf dist
	@poetry build

clean:
	@rm -rf .pytest-incremental

format:
	@poetry run black .

lint:
	@poetry run pylint ./makenew_serverless_python
	@poetry run black --check .

publish:
	@poetry run twine upload dist/*

test:
	@poetry run pytest --inc --cov=./makenew_serverless_python

watch:
	@poetry run ptw

.PHONY: build docs test
