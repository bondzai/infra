export ZSH="$HOME/.oh-my-zsh"
export ZSH_WAKATIME_PROJECT_DETECTION=true

ZSH_THEME="jb"

COMPLETION_WAITING_DOTS="%F{red}waiting...%f"
COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-wakatime
  )

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[[ -s "/home/jb/.gvm/scripts/gvm" ]] && source "/home/jb/.gvm/scripts/gvm"
export GO111MODULE=on

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias configuration
alias jb-ip="curl http://ipecho.net/plain; echo"
alias work-git-clone='bash ~/Desktop/code/tools/git-clone/main.sh'
