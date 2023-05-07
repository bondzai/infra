#!/bin/bash

#Adding colors
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
# C="$(printf '\033[1;36m')"

banner(){
clear
printf ${R}"████████╗██████╗ \n"
printf     "╚══██╔══╝██╔══██╗\n"
printf     "   ██║   ██████╔╝\n"
printf     "   ██║   ██╔══██╗\n"
printf     "█████║   ██████╔╝\n"
printf     "╚════╝   ╚═════╝ \n"${W}
printf ${Y}"                By James-Bond\n"${W}
}

function install_package {
    command -v $1 &> /dev/null && {
        echo
        echo "$1 already installed."
        echo
        return 0
    }
    echo
    echo "$1 not found. Installing $1..."
    echo
    sudo apt-get update
    sudo apt-get install $1 -y
}

banner

install_package curl

install_package wget

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb