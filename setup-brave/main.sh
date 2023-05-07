#!/bin/bash

function install_package {
    command -v $1 &> /dev/null && {
        echo "$1 already installed."
        return 0
    }
    echo "$1 not found. Installing $1..."
    sudo apt-get update
    sudo apt-get install $1 -y
}

install_package curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser