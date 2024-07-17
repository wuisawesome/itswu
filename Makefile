upload: SHELL:=/bin/bash
upload:
	rm -rf dist
	python -m build
	twine upload -u __token__ -p $$(cat .pypitoken) dist/*
