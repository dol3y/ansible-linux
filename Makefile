dependencies:
	sudo apt-get update
	sudo apt-get -y install libffi6 libssl1.0.0
	sudo apt-get -y install python3-pip libssl-dev libffi-dev
	#sudo -H pip2 install --upgrade setuptools

pipenv: dependencies
	pip install --user pipenv
	export PATH=\$HOME/.local/bin:\$PATH && pipenv install -e .
