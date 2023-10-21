#!/bin/bash

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
    sudo apt install -y net-tools iputils-ping
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

setup_zsh() {
    # Check if zsh is installed
    if ! command -v zsh &> /dev/null; then
        echo "Installing zsh..."
        sudo apt update
        sudo apt install -y zsh
    else
        echo "zsh is already installed."
        exit 1
    fi

    # Check if git is installed
    if ! command -v git &> /dev/null; then
        echo "Installing git..."
        sudo apt update
        sudo apt install -y git
    else
        echo "git is already installed."
    fi

    # Install oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "oh-my-zsh is already installed."
    fi

    # Set zsh as default shell
    chsh -s $(which zsh)

    # Define ZSH_CUSTOM if not set
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # Install zsh-autosuggestions
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        echo "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    else
        echo "zsh-autosuggestions is already installed."
    fi

    # Install zsh-syntax-highlighting
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        echo "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    else
        echo "zsh-syntax-highlighting is already installed."
    fi

    # Install zsh-wakatime
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-wakatime" ]; then
        echo "Installing zsh-wakatime..."
        cd $ZSH_CUSTOM/plugins && git clone https://github.com/wbingli/zsh-wakatime.git
    else
        echo "zsh-wakatime is already installed."
    fi

    # Update .zshrc to include plugins if they aren't already there
    if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
        sed -i.bak 's/^plugins=(/plugins=(zsh-autosuggestions /' $HOME/.zshrc
    fi
    if ! grep -q "zsh-syntax-highlighting" "$HOME/.zshrc"; then
        sed -i.bak 's/^plugins=(/plugins=(zsh-syntax-highlighting /' $HOME/.zshrc
    fi
    if ! grep -q "zsh-wakatime" "$HOME/.zshrc"; then
        sed -i.bak 's/^plugins=(/plugins=(zsh-wakatime /' $HOME/.zshrc
    fi

    echo "Setup complete! If you made any new installations, please restart your terminal or execute 'source ~/.zshrc' to activate changes."
}
