#!/bin/sh
prerequisite () {
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev zlib1g libbz2-dev
    sudo apt-get install libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev
    sudo apt-get install xz-utils tk-dev libffi-dev liblzma-dev python-openssl git lzma
}

install () {
    curl https://pyenv.run | bash
}

post () {
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    exec $SHELL
}

prerequisite
install
post