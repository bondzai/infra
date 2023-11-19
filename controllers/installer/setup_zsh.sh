#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_plugins() {
    # Define the ZSH_CUSTOM directory
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

    # Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

    # Install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

    # Configure zshrc with plugins
    sed -i '/^plugins=(git)/s/)$/ zsh-autosuggestions zsh-syntax-highlighting)/' $HOME/.zshrc
}

setup_aliases() {
    # Read contents from .zsh_aliases file in the same directory as the script
    ALIASES_FILE="$SCRIPT_DIR/.zsh_aliases"
    if [ -f "$ALIASES_FILE" ]; then
        cat "$ALIASES_FILE" >> $HOME/.zsh_aliases
    fi
}

setup_version_managers() {
    # Read contents from .zsh_version_managers file in the same directory as the script
    VM_FILE="$SCRIPT_DIR/.zsh_vms"
    if [ -f "$VM_FILE" ]; then
        cat "$VM_FILE" >> $HOME/.zsh_vms
    fi
}

main() {
    install_oh_my_zsh
    install_plugins
    setup_aliases
    setup_version_managers

    echo "Installation completed. Please reopen your terminal."
    # Optionally, restart the shell
    exec zsh
}

# Run the main function
main

setup_zsh() {
    # Check if zsh is installed
    if ! command -v zsh &> /dev/null; then
        echo "Installing zsh..."
        sudo apt update
        sudo apt install -y zsh
    else
        echo "zsh is already installed."
        exit 1
    fi

    # Check if git is installed
    if ! command -v git &> /dev/null; then
        echo "Installing git..."
        sudo apt update
        sudo apt install -y git
    else
        echo "git is already installed."
    fi

    # Install oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "oh-my-zsh is already installed."
    fi

    # Set zsh as default shell
    chsh -s $(which zsh)

    # Define ZSH_CUSTOM if not set
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # Install zsh-autosuggestions
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        echo "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    else
        echo "zsh-autosuggestions is already installed."
    fi

    # Install zsh-syntax-highlighting
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        echo "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    else
        echo "zsh-syntax-highlighting is already installed."
    fi

    # Install zsh-wakatime
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-wakatime" ]; then
        echo "Installing zsh-wakatime..."
        cd $ZSH_CUSTOM/plugins && git clone https://github.com/wbingli/zsh-wakatime.git
    else
        echo "zsh-wakatime is already installed."
    fi

    # Update .zshrc to include plugins if they aren't already there
    if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
        sed -i.bak 's/^plugins=(/plugins=(zsh-autosuggestions /' $HOME/.zshrc
    fi
    if ! grep -q "zsh-syntax-highlighting" "$HOME/.zshrc"; then
        sed -i.bak 's/^plugins=(/plugins=(zsh-syntax-highlighting /' $HOME/.zshrc
    fi
    if ! grep -q "zsh-wakatime" "$HOME/.zshrc"; then
        sed -i.bak 's/^plugins=(/plugins=(zsh-wakatime /' $HOME/.zshrc
    fi

    echo "Setup complete! If you made any new installations, please restart your terminal or execute 'source ~/.zshrc' to activate changes."
}
