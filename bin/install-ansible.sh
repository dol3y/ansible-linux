#!/usr/bin/env bash

DIRNAME=$(dirname $0)

sudo apt-get update
sudo apt-get -y install libffi6 libssl1.0.0
sudo apt-get -y install python-pip libssl-dev libffi-dev
sudo -H pip2 install --upgrade setuptools
sudo -H pip2 install -r $DIRNAME/requirements.txt
