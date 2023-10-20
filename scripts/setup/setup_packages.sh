#!/bin/bash
setup_docker() {
    echo -e "setup docker..."
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

setup_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
}