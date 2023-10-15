#!/bin/sh

# Step 1: Update apt
update_apt() {
    sudo apt update
}

# Step 2: Check if nala is not installed, then install it
install_nala() {
    if ! command -v nala >/dev/null 2>&1; then
        sudo apt install -y nala
    fi
}

# Step 3: Install docker.io using nala
install_docker_with_nala() {
    sudo nala install docker.io
}

# Step 4: Check if installation is successful and show a message
check_docker_installation() {
    if command -v docker >/dev/null 2>&1; then
        echo "Docker installation completed successfully."
    else
        echo "Docker installation failed."
        exit 1
    fi
}

# Step 5: Install docker.io using apt-get if nala installation failed
install_docker_with_apt_get() {
    if ! command -v docker >/dev/null 2>&1; then
        sudo apt-get install -y docker.io
    fi
}

# Step 6: Install docker-compose in the same flow as steps 1-5
install_docker_compose() {
    sudo apt-get install -y docker-compose
}

# Call the functions
update_apt
install_nala
install_docker_with_nala
check_docker_installation
install_docker_with_apt_get
install_docker_compose
