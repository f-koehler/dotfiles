# load zplug
source ~/.zplug/init.zsh

autoload compinit && compinit
autoload colors && colors

# enable proper prompt substitution
setopt prompt_subst
zstyle ':completion:*' menu select

# let zplug manage itself
# zplug "zplug/zplug"

# load the awesome zsh-users plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# perform plugin installation if plugins not available
if ! zplug check; then
    zplug install
fi

# load zplug plugins
zplug load

# fix zsh-autosuggestion for solarized theme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# bash like word jumping
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

setopt auto_cd
setopt PUSHD_IGNORE_DUPS


####################
# PROMPT composition
####################
# set prompt char depending on user id
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
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg svn cvs bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}✔%{$reset_color%}"
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


#########
# aliases
#########
alias v='vim'
alias ll="ls -l"
alias dotfiles='git --git-dir ~/.dotfiles/ --work-tree=$HOME'
alias etcfiles='sudo git --git-dir ~/.etcfiles/ --work-tree=/etc'
setopt complete_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
