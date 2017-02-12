#!/usr/bin/env bash

sudo apt-get install libffi6 libssl1.0.0
sudo apt-get install python-pip libssl-dev libffi-dev
sudo -H pip install\
  paramiko\
  PyYAML\
  Jinja2\
  httplib2\
  six\
  ansible==2.2.0.0