autoload colors && colors
autoload -Uz vcs_info

prompt_char() {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

prompt_separator_and_status() {
    PROMPT_RETVAL=$?

    STATUS=""
    if [[ $PROMPT_RETVAL -ne 0 ]]; then
        STATUS+="%{$fg_no_bold[red]%}✘ "
    else
        STATUS+="%{$fg_no_bold[green]%}✓ "
    fi
    [[ $(jobs -l | wc -l) -gt 0 ]] && STATUS+="%{$fg_no_bold[cyan]%}⚙ "

    echo "%{$fg[yellow]%}${(r:$(expr $COLUMNS - 9)::─:)} %*"
    echo "$STATUS"
}

# use vcs_info
zstyle ':vcs_info:*' enable git hg svn cvs bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%} ⚑%{$reset_color%}"
zstyle ':vcs_info:*' unstagedstr "%{$fg[yellow]%}⚡%{$reset_color%}"
zstyle ':vcs_info:*' formats "%{$fg[green]%}(%s:%b)%{$reset_color%}%c %u"
zstyle ':vcs_info:*' actionformats "%s→%b (%c%u) %a"

build_prompt() {
    PROMPT=$'$(prompt_separator_and_status)%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%{$fg_no_bold[red]%}%~%{$fg[green]%}) ${vcs_info_msg_0_}%_%{$fg_bold[green]%}$(prompt_char)%{$reset_color%} '
}

precmd() {
    vcs_info
    build_prompt
}
