#!/bin/bash

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Update the system
echo "Updating system..."
pacman -Syu --noconfirm

# Install Docker
echo "Installing Docker..."
pacman -S docker --noconfirm

# Start and enable Docker service
echo "Starting and enabling Docker service..."
systemctl start docker
systemctl enable docker

# Add the current user to the docker group
echo "Adding the current user to the docker group..."
usermod -aG docker $(whoami)

# Refresh group membership
newgrp docker

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

# Clean up
echo "Cleaning up..."
pacman -Rs docker --noconfirm
pacman -Sc --noconfirm

echo "Docker installation completed."
