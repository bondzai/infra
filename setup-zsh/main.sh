#!/bin/sh

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

install_curl
add_zsh
add_omzsh
add_plugin
