# ~/.zshrc

# Set ZSH and theme
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="archcraft"

# Enable Wakatime project detection
export ZSH_WAKATIME_PROJECT_DETECTION=true

# Set completion waiting dots
COMPLETION_WAITING_DOTS="%F{red}waiting...%f"
COMPLETION_WAITING_DOTS="true"

# Load plugins
plugins=(
    git
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
    wakatime
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load version manager configurations
source $HOME/.zshrc_version_managers

# Load custom aliases
source $HOME/.zshrc_aliases
