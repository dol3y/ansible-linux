dependencies:
	sudo apt-get update
	sudo apt-get -y install libffi6 libssl1.0.0
	sudo apt-get -y install python3-pip libssl-dev libffi-dev

pipenv: dependencies
	pip3 install --user pipenv
	export PATH=$$HOME/.local/bin:$$PATH && pipenv install
	#ansible-playbook setup.yml --tags sudo -K
