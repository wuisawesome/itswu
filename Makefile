clean:
	rm -rf dist
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type f -name "*.pyc" -exec rm -r {} +
	rm -rf *.egg-info

install: clean
	pip install -e .

upload: SHELL:=/bin/bash
upload: clean
	python -m build
	twine upload -u __token__ -p $$(cat .pypitoken) dist/*

lint: clean
	black itswu
	black tests
	mypy --no-namespace-packages itswu
	mypy --no-namespace-packages tests

test:
	pytest -v tests/
