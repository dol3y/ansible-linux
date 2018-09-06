deps:
	sudo apt-get -y install libffi6 libssl1.0.0 python3-pip libssl-dev libffi-dev

pipenv: deps
	test -f $$HOME/.local/bin/pipenv || pip3 install --user pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv --three --site-packages
	export PATH=$$HOME/.local/bin:$$PATH && pipenv install --dev

lint: pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv run ansible-lint setup.yml

sudo: pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv run ansible-playbook setup.yml --tags sudo -K

ansible: pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv run ansible-playbook setup.yml

clean:
	export PATH=$$HOME/.local/bin:$$PATH && pipenv --rm
