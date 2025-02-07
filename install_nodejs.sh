#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install curl if it is not already installed
echo "Installing curl..."
sudo apt install -y curl

# Add the NodeSource repository
echo "Adding NodeSource repository..."
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

# Install Node.js
echo "Installing Node.js..."
sudo apt install -y nodejs

# Verify installation
echo "Verifying installation..."
node -v
npm -v

echo "Node.js and npm have been installed successfully!"
