#!/bin/bash

# Remove the default NGINX configuration
sudo rm /etc/nginx/sites-enabled/default

# Create a new NGINX configuration file
sudo bash -c 'cat > /etc/nginx/sites-available/flask_app <<EOL
server {
    listen 80;
    server_name _;

    location / {
        include proxy_params;
        proxy_pass http://unix:/home/${USER}/flask-hello-world/flask_app.sock;
    }
}
EOL'

# Enable the new NGINX configuration
sudo ln -s /etc/nginx/sites-available/flask_app /etc/nginx/sites-enabled

# Restart NGINX to apply the changes
sudo systemctl restart nginx
