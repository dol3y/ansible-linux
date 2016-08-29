#!/usr/bin/env bash

sudo apt-get install python-pip python3-pip libssl-dev
sudo -H pip install paramiko PyYAML Jinja2 httplib2 six ansible
#sudo -H pip install boto
#sudo -H pip install azure==2.0.0rc5
