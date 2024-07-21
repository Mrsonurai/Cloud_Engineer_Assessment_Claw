#!/bin/bash

# Define variables
STORAGE_ACCOUNT_NAME=$1
CONTAINER_NAME=$2

# Create a sample index.html file
echo "<h1>Hello, World!</h1>" > /home/$(whoami)/index.html

# Upload the index.html file to the Azure storage container
az storage blob upload \
  --account-name $STORAGE_ACCOUNT_NAME \
  --container-name $CONTAINER_NAME \
  --file /home/$(whoami)/index.html \
  --name index.html
