#!/bin/bash

exec_check_installed_packages() {
    dpkg --get-selections | grep -v deinstall | cut -f1
}

exec_update() {
    sudo apt update && sudo apt upgrade -y
    pprint -s "System is up to date!"
}

exec_cleanup() {
    trash-empty
    pprint -s "Trash empty!"
}

exec_detect_os() {
    detect_os
    pprint -s "Detect OS successfully!"
}

exec_update_packages() {
    OS_ID=$(get_os_id)
    case $OS_ID in
        ubuntu|debian|linuxmint)
        echo "Updating packages using apt..."
        sudo apt-get update && sudo apt-get upgrade
        ;;
        arch|manjaro)
        echo "Updating packages using pacman..."
        sudo pacman -Syu
        ;;
        fedora|rhel|centos)
        echo "Updating packages using dnf..."
        sudo dnf update
        ;;
        suse|opensuse)
        echo "Updating packages using zypper..."
        sudo zypper update
        ;;
        unknown)
        echo "Unable to detect OS for package updates"
        ;;
        *)
        echo "Unsupported OS for package updates"
        ;;
    esac
}

