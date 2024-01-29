#!/bin/bash

# Update the system packages
sudo apt-get update

# Install Python Pip python3-venv
sudo apt install -y python3 python3-pip python3-venv

# Check if the directory exists
if [ ! -d "/home/vagrant/myapp" ]; then
    mkdir /home/vagrant/myapp
fi

cd /home/vagrant/myapp

# Create a virtual environment
python3 -m venv flask_env

# Activate the virtual environment
source /home/vagrant/myapp/flask_env/bin/activate

# Install Flask & requirements
pip install -r /home/vagrant/myapp/requirements.txt

# Run Flask app in the background
nohup python3 -m flask run --host=0.0.0.0 &

sleep 5
