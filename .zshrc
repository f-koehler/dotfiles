# load zplug
source ~/.zplug/init.zsh

# enable proper prompt substitution
setopt prompt_subst
zstyle ':completion:*' menu select

# let zplug manage itself
# zplug "zplug/zplug"

# load stuff from oh-my-zsh
zplug "lib/history",        from:oh-my-zsh, nice:10
zplug "lib/key-bindings",   from:oh-my-zsh, nice:10
zplug "plugins/docker",     from:oh-my-zsh, nice:10, if:"(( $+commands[docker] ))"
zplug "plugins/git",        from:oh-my-zsh, nice:10, if:"(( $+commands[git] ))"
zplug "plugins/mercurial",  from:oh-my-zsh, nice:10, if:"(( $+commands[hg] ))"
zplug "plugins/rsync",      from:oh-my-zsh, nice:10, if:"(( $+commands[rsync] ))"
zplug "plugins/svn",        from:oh-my-zsh, nice:10, if:"(( $+commands[svn] ))"

# load plugins from github
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
# set empty prompt
PROMPT=""

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
PROMPT+=$'$(prompt_separator_and_status)'

# add the main prompt
PROMPT+=$'%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%{$fg_no_bold[red]%}%~%{$fg[green]%}) '

# add git info if git is installed
if (( $+commands[git] )) ; then
    ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⚡"
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}(git:"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
    PROMPT+=$'$(git_prompt_info)'
fi

# add mercurial info if mercurial is installed
if (( $+commands[hg] )) ; then
    ZSH_THEME_HG_PROMPT_CLEAN=" ✓"
    ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[yellow]%} ⚡"
    ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[green]%}(hg:"
    ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
    PROMPT+=$'$(hg_prompt_info)'
fi

# add subversion info if subversion is installed
if (( $+commands[svn] )) ; then
    ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[yellow]%} ⚡"
    ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg[green]%}(svn:"
    ZSH_THEME_SVN_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
    PROMPT+=$'$(svn_prompt_info)'
fi

PROMPT+=$' %_%{$fg_bold[green]%}$(prompt_char)%{$reset_color%} '

# source ~/.local.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
