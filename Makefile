all: lint test

lint:
	@pipenv run python setup.py lint

build:
	@rm -rf build dist
	@pipenv run python setup.py sdist bdist_wheel

publish:
	@pipenv run twine upload dist/*

test:
	@pipenv run python setup.py test

watch:
	@pipenv run ptw

.PHONY: build docs test
