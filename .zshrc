# load zplug
source ~/.zplug/init.zsh

# enable proper prompt substitution
setopt prompt_subst
zstyle ':completion:*' menu select

# let zplug manage itself
zplug "zplug/zplug"

# load stuff from oh-my-zsh
zplug "lib/history", from:oh-my-zsh, nice:10
zplug "lib/key-bindings", from:oh-my-zsh, nice:10
zplug "plugins/git",   from:oh-my-zsh, nice:10, if:"(( $+commands[git] ))"
zplug "themes/gentoo", from:oh-my-zsh, nice:11

# load plugins from github
zplug "marzocchi/zsh-notify"
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

# custom prompt
# PS1_LINE=$'%{$fg[yellow]%}${(r:$(expr $COLUMNS - 9)::\u2500:)} %*\n'
# PS1_PROMPT=$'%{$fg[green]%}%B%n@%m%b %{$fg[red]%}%~ %{$fg[green]%}$(git_prompt_info)%B%{$fg[green]%}\$%b %{$reset_color%}'
# export PS1=${PS1_LINE}${PS1_PROMPT}
# ZSH_THEME_GIT_PROMPT_PREFIX="("
# ZSH_THEME_GIT_PROMPT_SUFFIX=") "

# PS1=$'%{$fg[yellow]%}${(r:$(expr $COLUMNS - 9)::\u2500:)} %*\n'$PS1

function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT=$'%{$fg[yellow]%}${(r:$(expr $COLUMNS - 9)::\u2500:)} %*\n''%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%{$fg_no_bold[red]%}%~%{$fg[green]%}) %{$fg[green]%}$(git_prompt_info)%_%{$fg_bold[green]%}$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

source ~/.local.sh
