#!/bin/bash

# Install necessary packages
sudo apt-get update
sudo apt-get install -y python3-pip python3-venv nginx git

# Clone the Flask application repository
git clone https://github.com/<your-username>/flask-hello-world.git /home/${USER}/flask-hello-world

# Set up a Python virtual environment and install dependencies
cd /home/${USER}/flask-hello-world
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Create a system service for the Flask application
sudo cp /home/${USER}/scripts/flask_app.service /etc/systemd/system/flask_app.service
sudo systemctl daemon-reload
sudo systemctl start flask_app.service
sudo systemctl enable flask_app.service

# Configure NGINX as a reverse proxy
sudo cp /home/${USER}/scripts/install_nginx.sh /home/${USER}/install_nginx.sh
sudo chmod +x /home/${USER}/install_nginx.sh
sudo /home/${USER}/install_nginx.sh
