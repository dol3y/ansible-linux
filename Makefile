deps:
	sudo apt-get -y install libffi6 libssl1.0.0 python3-pip libssl-dev libffi-dev

pipenv: deps
	test -f $$HOME/.local/bin/pipenv || pip3 install --user pipenv
	$$HOME/.local/bin/pipenv --three --site-packages
	$$HOME/.local/bin/pipenv install --dev

lint: pipenv
	$$HOME/.local/bin/pipenv run ansible-lint setup.yml

sudo: pipenv
	$$HOME/.local/bin/pipenv run ansible-playbook setup.yml --tags sudo -K

ansible: pipenv
	$$HOME/.local/bin/pipenv run ansible-playbook setup.yml

clean:
	$$HOME/.local/bin/pipenv --rm
