.DEFAULT_GOAL := pipenv

dependencies:
	sudo apt-get -y install libffi6 libssl1.0.0 python3-pip libssl-dev libffi-dev

pipenv: dependencies
	test -f $$HOME/.local/bin/pipenv || pip3 install --user pipenv
	$$HOME/.local/bin/pipenv --three --site-packages
	$$HOME/.local/bin/pipenv install --dev

upgrade:
	pip3 install --user --upgrade pipenv

clean:
	$$HOME/.local/bin/pipenv --rm

.PHONY: dependencies pipenv upgrade clean
