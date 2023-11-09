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
    VM_FILE="$SCRIPT_DIR/.zsh_version_managers"
    if [ -f "$VM_FILE" ]; then
        cat "$VM_FILE" >> $HOME/.zsh_version_managers
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
