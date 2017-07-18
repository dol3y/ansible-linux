#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install libffi6 libssl1.0.0
sudo apt-get -y install python-pip libssl-dev libffi-dev
sudo -H pip2 install\
  paramiko\
  PyYAML\
  Jinja2==2.8.1\
  httplib2\
  six\
  ansible==2.2.1.0
