#!/bin/bash
setup_docker() {
    echo -e "setup docker..."
}

setup_k8s() {
    echo -e "setup k8s..."
}

setup_wireguard() {
    echo -e "setup wireguard..."
}

setup_chrome() {
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}

setup_brave() {
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
}

setup_network() {
    apt-get install -y net-tools iputils-ping
}

setup_zerotier() {
    curl -s https://install.zerotier.com | sudo bash
}

setup_ssh_server() {
    sudo apt install openssh-server
    sudo service ssh status
    eval "$(ssh-agent -s)"
}

setup_protoc() {
    apt install -y protobuf-compiler
    protoc --version  # Ensure compiler version is 3+
}
