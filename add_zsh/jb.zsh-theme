# JB.zsh

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '$: ' && return
    echo '$: '
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

PROMPT="╭─%{$FG[255]%}%n%{$reset_color%}%{$FG[239]%}🌙️%{$reset_color%}%{$FG[255]%}$(box_name)%{$reset_color%} %{$FG[239]%}>>>%{$reset_color%} %{$terminfo[bold]$FG[222]%}%~%{$reset_color%}\$(git_prompt_info)
╰─\$(virtualenv_info)\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[255]%}[%{$reset_color%}%{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"