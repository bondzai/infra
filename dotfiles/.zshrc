export ZSH="$HOME/.oh-my-zsh"

# Theme configuration
ZSH_THEME="jonathan"

plugins=(
    git
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
  )

source $ZSH/oh-my-zsh.sh

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/home/jb/.gvm/scripts/gvm" ]] && source "/home/jb/.gvm/scripts/gvm"
export GOROOT=~/goroot
export PATH=$PATH:$GOROOT/bin

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# Alias configuration
alias jbip="curl http://ipecho.net/plain; echo"
