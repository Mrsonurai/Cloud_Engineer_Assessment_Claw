#!/bin/bash

# Update the package list
sudo apt-get update

# Install prerequisites
sudo apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg

# Download and install the Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-archive-keyring.gpg > /dev/null

# Add the Azure CLI software repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update the package list again and install the Azure CLI
sudo apt-get update
sudo apt-get install -y azure-cli

# Authenticate with Azure CLI
# Note: For security reasons, you should use a managed identity or service principal for authentication in a production environment.
az login --identity

# Create a directory for the index.html file
mkdir -p /home/${USER}/azure_storage
cd /home/${USER}/azure_storage

# Create a sample index.html file
echo "<h1>Hello, World!</h1>" > index.html

# Upload the index.html file to the Azure storage container
STORAGE_ACCOUNT_NAME=$(curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/name?api-version=2021-02-01&format=text" | tr -d '\n' | tr '[:upper:]' '[:lower:]')
az storage blob upload --account-name $STORAGE_ACCOUNT_NAME --container-name mycontainer --file index.html --name index.html
