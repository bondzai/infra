#!/bin/bash

# Install dependencies
sudo pacman -Sy --noconfirm git base-devel

# Clone yay repository
git clone https://aur.archlinux.org/yay.git
cd yay

# Build and install yay
makepkg -si --noconfirm

# Clean up yay build files
cd ..
rm -rf yay

# Install AUR packages
yay -Sy --noconfirm package1 package2 package3
