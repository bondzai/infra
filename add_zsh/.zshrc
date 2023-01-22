export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="JB"

COMPLETION_WAITING_DOTS="%F{red}waiting...%f"
COMPLETION_WAITING_DOTS="true"

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

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alias configuration
alias jbip="curl http://ipecho.net/plain; echo"