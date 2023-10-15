#!/bin/bash

# Install necessary packages
sudo apt-get update
sudo apt-get install openbox tint2 lxappearance compton nitrogen obmenu-generator

# Download and apply ArchLabs themes and wallpapers
git clone https://github.com/ArchLabs/ArchLabs-Openbox.git
cd ArchLabs-Openbox

# Copy Openbox theme and configure it
mkdir -p ~/.config/openbox
cp -r themes/archlabs-dark ~/.themes/
cp -r themes/archlabs-icons ~/.icons/
cp autostart ~/.config/openbox/
cp menu.xml ~/.config/openbox/

# Set the wallpaper using nitrogen
nitrogen --set-zoom-fill path/to/your/wallpaper.jpg

# Configure tint2 panel
cp tint2rc ~/.config/tint2/

# Configure compton for transparency effects
cp compton.conf ~/.config/

# Customize the applications menu (obmenu-generator)
cp obmenu-generator/schema.pl ~/.config/
obmenu-generator -p -i

# Set up lxappearance for theme and icon configuration
lxappearance

# Restart Openbox to apply changes
openbox --restart
