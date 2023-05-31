#!/bin/bash

# Update and upgrade the server
sudo apt-get update
sudo apt-get upgrade -y

# Check if Docker and Docker Compose are installed, if not install both
if ! command -v docker &> /dev/null
then
    echo "Docker not found, installing..."
    curl -fsSL https://get.docker.com - get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "Docker installed successfully"
fi

if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose not found, installing..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed successfully"
fi

# Clone the Mailcow repository and generate the configuration
cd /opt
sudo git clone https://github.com/mailcow/mailcow-dockerized.git
cd mailcow-dockerized
sudo ./generate_config.sh

# Pull the Docker images and start the containers
sudo docker-compose pull
sudo docker-compose up -d
