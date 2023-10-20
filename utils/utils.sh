#!/bin/bash

setup_deps() {
    echo
    echo -e ${GREEN}"Installing $1 ..."${WHITE}
    command -v $1 &> /dev/null && {
        echo
        echo -e ${CYAN}"$1 already installed."${WHITE}
        echo
        return 0
    }
    echo
    echo -e ${GREEN}"$1 not found. Installing $1..."${WHITE}
    echo
    sudo apt-get update
    sudo apt-get install $1 -y
}

check_os() {
    echo -e "check distro..."
}

check_version() {
    package_version=$(packge --version)
    if [ $? -eq 0 ]; then
        echo "$package installed successfully. Version: $packge_version"
    else
        echo "$package installation failed."
        exit 1
    fi
}
