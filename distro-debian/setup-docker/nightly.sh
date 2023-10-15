#!/bin/bash

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Update the package list
echo "Updating package list..."
apt-get update

# Install required packages for Docker
echo "Installing required packages..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repository
echo "Adding Docker repository..."
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# Update the package list again to include Docker
echo "Updating package list again..."
apt-get update

# Install Docker
echo "Installing Docker..."
apt-get install -y docker-ce

# Start and enable Docker service
echo "Starting and enabling Docker service..."
systemctl start docker
systemctl enable docker

# Add the current user to the docker group
echo "Adding the current user to the docker group..."
usermod -aG docker $(whoami)

# Verify Docker installation
docker_version=$(docker --version)
if [ $? -eq 0 ]; then
    echo "Docker installed successfully. Version: $docker_version"
else
    echo "Docker installation failed."
    exit 1
fi

# Test Docker with hello-world
echo "Testing Docker with hello-world..."
docker run hello-world

echo "Docker installation completed."
