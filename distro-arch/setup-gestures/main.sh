#!/bin/bash

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root."
    exit 1
fi

# Install libinput-gestures
echo "Installing libinput-gestures..."
sudo pacman -S libinput-gestures

# Enable and start the libinput-gestures service
echo "Enabling and starting libinput-gestures service..."
sudo systemctl enable --now libinput-gestures.service

# Add the current user to the input group
echo "Adding your user to the input group..."
sudo gpasswd -a $USER input

# Create a configuration file for libinput-gestures
echo "Creating libinput-gestures configuration..."
cat <<EOF > ~/.config/libinput-gestures.conf
gesture swipe up 3 xdotool key super+Page_Up
gesture swipe down 3 xdotool key super+Page_Down
EOF

# Start libinput-gestures
echo "Starting libinput-gestures..."
libinput-gestures-setup start

echo "Three-finger swipe gestures for workspace switching are configured."

# Exit the script
exit 0
