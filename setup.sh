#!/bin/bash

# Prompt the user for the version of Node.js to install
echo "Enter the version of Node.js you want to install (e.g., 14, 16, 18):"
read NODE_VERSION

# Add the NodeSource repository for the specified version
curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -

# Install Node.js and npm
sudo apt-get install -y nodejs

# Verify and print the installed versions
echo "Node.js and npm have been installed successfully!"
node -v
npm -v

