.DEFAULT_GOAL := install

dependencies:
	sudo apt-get -y install libffi6 libssl1.0.0 python3-pip libssl-dev libffi-dev

install: dependencies
	test -f $$HOME/.local/bin/pipenv || pip3 install --user pipenv
	$$HOME/.local/bin/pipenv --three --site-packages
	$$HOME/.local/bin/pipenv install --dev

update:
	$$HOME/.local/bin/pipenv update

upgrade:
	pip3 install --user --upgrade pipenv

rm:
	$$HOME/.local/bin/pipenv --rm

.PHONY: dependencies install upgrade rm
