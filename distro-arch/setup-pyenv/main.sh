#!/bin/bash

# Check if the script is running with a supported shell (bash or zsh)
SUPPORTED_SHELLS=("bash" "zsh")
CURRENT_SHELL=$(basename "$SHELL")
if [[ ! " ${SUPPORTED_SHELLS[@]} " =~ " $CURRENT_SHELL " ]]; then
    echo "Unsupported shell. Please use Bash or Zsh."
    exit 1
fi

# Update your system's package database and upgrade the system packages to their latest versions
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install dependencies
echo "Installing dependencies..."
sudo pacman -S --needed base-devel git --noconfirm

# Clone the pyenv repository into ~/.pyenv
echo "Cloning pyenv repository into ~/.pyenv..."
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Add pyenv to the PATH
if [ "$CURRENT_SHELL" = "bash" ]; then
    PROFILE_FILE="$HOME/.bashrc"
elif [ "$CURRENT_SHELL" = "zsh" ]; then
    PROFILE_FILE="$HOME/.zshrc"
fi

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$PROFILE_FILE"
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$PROFILE_FILE"

# Initialize pyenv
echo "Initializing pyenv..."
echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> "$PROFILE_FILE"
echo '  eval "$(pyenv init -)"' >> "$PROFILE_FILE"
echo 'fi' >> "$PROFILE_FILE"

# Reload the shell configuration
source "$PROFILE_FILE"

# Install pyenv-virtualenv plugin
echo "Installing pyenv-virtualenv plugin..."
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# Verify pyenv installation
pyenv_version=$(pyenv --version)
if [ $? -eq 0 ]; then
    echo "pyenv installed successfully. Version: $pyenv_version"
else
    echo "pyenv installation failed."
    exit 1
fi

# Clean up
echo "Cleaning up..."
sudo pacman -Rs git --noconfirm
sudo pacman -Sc --noconfirm

echo "pyenv installation completed. You may need to restart your shell session."
