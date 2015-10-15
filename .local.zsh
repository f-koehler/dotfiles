bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

PS1_LINE=$'%{$fg[yellow]%}${(r:$(expr $COLUMNS - 9)::\u2500:)} %*\n'
PS1_PROMPT=$'%{$fg[green]%}%B%n@%m%b %{$fg[red]%}%~ %{$fg[green]%}$(git_prompt_info)%B%{$fg[green]%}\$%b %{$reset_color%}'
export PS1=${PS1_LINE}${PS1_PROMPT}
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

source ~/.local.sh
