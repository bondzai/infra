#!/bin/bash

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root."
    exit 1
fi

flatpak install flathub com.gitlab.cunidev.Gestures