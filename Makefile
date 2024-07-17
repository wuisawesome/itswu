upload: SHELL:=/bin/bash
upload:
	rm -rf dist
	python -m build
	twine upload -u __token__ -p $$(cat .pypitoken) dist/*

lint:
	black itswu
	black tests
	mypy --no-namespace-packages itswu

test:
	pytest -v tests/
