#!/bin/sh

install_curl() {
    sudo apt-get update
    sudo apt-get install -y curl
}

add_zsh() {
    sudo apt-get install -y zsh
}

add_omzsh() {
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true
}

add_plugin () {
    ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom} # set a default value if ZSH_CUSTOM is not set
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/wbingli/zsh-wakatime.git
}

copy_config () {
    cp $PWD/.zshrc ~/
    cp $PWD/jb.zsh-theme ~/.oh-my-zsh/custom/themes/
}

exec $SHELL

# error handling is managed by function itself
if ! install_curl; then echo "Error installing curl"; exit 1; fi
if ! add_zsh; then echo "Error installing zsh"; exit 1; fi
if ! add_omzsh; then echo "Error installing Oh My Zsh"; exit 1; fi
if ! add_plugin; then echo "Error adding plugins"; exit 1; fi
if ! copy_config; then echo "Error copying config"; exit 1; fi
curl -s https://ohmyposh.dev/install.sh | bash -s