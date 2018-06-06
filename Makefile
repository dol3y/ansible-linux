deps:
	sudo apt-get update
	sudo apt-get -y install libffi6 libssl1.0.0
	sudo apt-get -y install python3-pip libssl-dev libffi-dev
	#sudo -H pip3 install --upgrade setuptools

pipenv: deps
	test -f $$HOME/.local/bin/pipenv || pip3 install --user pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv --three --site-packages
	export PATH=$$HOME/.local/bin:$$PATH && pipenv install

sudo: pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv run ansible-playbook -i hosts setup.yml --tags sudo -K

ansible: pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv run ansible-playbook -i hosts setup.yml

clean:
	export PATH=$$HOME/.local/bin:$$PATH && pipenv --rm
