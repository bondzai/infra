#!/bin/bash

setup_starter_packages() {
    sudo apt update && sudo apt upggrade -y
    setup_git
    setup_docker
}

setup_git() {
    sudo apt install git
}

setup_docker() {
    sudo apt install docker.io
}

setup_k8s() {
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    kubectl version --client
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
    sudo apt update && sudo apt install -y net-tools iputils-ping speedtest-cli
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

setup_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
}

setup_gvm() {
    sudo apt-get install curl git mercurial make binutils bison gcc build-essential -y
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
}

setup_ngrok() {
    if [ ! -f /usr/local/bin/ngrok ]; then
        echo "Downloading ngrok..."
        wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
        unzip ngrok-stable-linux-amd64.zip
        sudo mv ngrok /usr/local/bin/
        rm ngrok-stable-linux-amd64.zip
        echo "ngrok has been installed."
    else
        echo "ngrok is already installed."
    fi

    /usr/local/bin/ngrok authtoken $NGROK_AUTHTOKEN
    echo "ngrok authtoken has been configured."
}

setup_make() {
    sudo apt install make    
}
