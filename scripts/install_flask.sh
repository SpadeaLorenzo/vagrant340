#!/bin/bash

# Update the system packages
sudo apt-get update

# Install Python 3 and Pip
sudo apt-get install python3 python3-pip

mkdir /home/vagrant/myapp

cd /home/vagrant/myapp

# Create a virtual environment
python3 -m venv flask_env

# Activate the virtual environment
source flask_env/bin/activate

# Install Flask & requirements
$ pip install -r /home/vagrant/myapp/requirements.txt

python app.py
