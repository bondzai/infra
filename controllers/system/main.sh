#!/bin/bash

exec_check_installed_packages() {
    dpkg --get-selections | grep -v deinstall | cut -f1
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
        pprint -p "Updating packages using apt$LAUNCH"
        sudo apt-get update && sudo apt-get upgrade
        ;;
        arch|manjaro)
        pprint -p "Updating packages using pacman$LAUNCH"
        sudo pacman -Syu
        ;;
        fedora|rhel|centos)
        pprint -p "Updating packages using dnf$LAUNCH"
        sudo dnf update
        ;;
        suse|opensuse)
        pprint -p "Updating packages using zypper$LAUNCH"
        sudo zypper update
        ;;
        unknown)
        pprint -p "Unable to detect OS for package updates"
        ;;
        *)
        pprint -p "Unsupported OS for package updates"
        ;;
    esac
}

