#!/bin/sh

set -e

install_curl() {
    sudo apt-get update
    sudo apt-get install curl
}

add_zsh() {
    sudo apt-get install zsh
}

add_omzsh() {
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

add_plugin () {
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

install_curl || { echo "Error installing curl"; exit 1; }
add_zsh || { echo "Error installing zsh"; exit 1; }
add_omzsh || { echo "Error installing Oh My Zsh"; exit 1; }
add_plugin || { echo "Error adding plugins"; exit 1; }
