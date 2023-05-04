#!/bin/bash

# Define a function to install a package using apt-get
function install_package {
    command -v $1 &> /dev/null && {
        echo "$1 already installed."
        return 0
    }
    echo "$1 not found. Installing $1..."
    sudo apt-get update
    sudo apt-get install $1 -y
}

# Install Git and Python if not already installed
install_package git
install_package python
