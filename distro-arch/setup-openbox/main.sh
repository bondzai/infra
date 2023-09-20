#!/bin/bash

# Update and Upgrade System
echo "Updating system..."
sudo pacman -Syu

# Install necessary packages
echo "Installing packages..."
sudo pacman -S --needed openbox obconf polybar obmenu-generator lxappearance picom nitrogen rofi dunst
# if error use yay instead

# Set up Openbox
mkdir -p ~/.config/openbox

# Set up Polybar
echo "Setting up Polybar..."
mkdir -p ~/.config/polybar
cp /usr/share/doc/polybar/config ~/.config/polybar/

# Generate Openbox menu
echo "Generating Openbox menu..."
obmenu-generator -i -p

# Autostart configurations
echo "Configuring autostart for Openbox..."
cat > ~/.config/openbox/autostart <<EOL
#!/bin/bash
picom &
nitrogen --restore &
polybar example &
EOL

# Make the autostart file executable
chmod +x ~/.config/openbox/autostart

# Set up wallpapers with Nitrogen
echo "Setting up Nitrogen for wallpapers..."
nitrogen --set-zoom-fill --random /usr/share/backgrounds/

echo "All done! Restart your session and log into Openbox."

