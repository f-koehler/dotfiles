bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

PS1_LINE=$'%{$fg[blue]%}${(r:$(expr $COLUMNS - 9)::\u2500:)} %*\n'
PS1_PROMPT=$'%{$fg[green]%}%B%n@%m%b %{$fg[red]%}%~ %{$fg[green]%}$(git_prompt_info)%B%{$fg[green]%}\$%b %{$reset_color%}'
export PS1=${PS1_LINE}${PS1_PROMPT}
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

export PATH=/usr/local/texlive/2015/bin/x86_64-linux:$PATH
export INFOPATH=/usr/local/texlive/2015/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2015/texmf-dist/doc/man:$MANPATH
