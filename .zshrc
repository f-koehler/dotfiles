# load zplug
source ~/.zplug/init.zsh

# enable proper prompt substitution
setopt prompt_subst
zstyle ':completion:*' menu select

# let zplug manage itself
zplug "zplug/zplug"

# load stuff from oh-my-zsh
zplug "lib/history",       from:oh-my-zsh, nice:10
zplug "lib/key-bindings",  from:oh-my-zsh, nice:10
zplug "plugins/git",       from:oh-my-zsh, nice:10
zplug "plugins/mercurial", from:oh-my-zsh, nice:10
zplug "plugins/svn",       from:oh-my-zsh, nice:10
zplug "themes/gentoo",     from:oh-my-zsh, nice:11

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
function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT=$'%{$fg[yellow]%}${(r:$(expr $COLUMNS - 9)::\u2500:)} %*\n''%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%{$fg_no_bold[red]%}%~%{$fg[green]%}) $(git_prompt_info)$(hg_prompt_info)$(svn_prompt_info) %_%{$fg_bold[green]%}$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[red]%} ⚡"
ZSH_THEME_HG_PROMPT_CLEAN=" ✓"

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ⚡"
ZSH_THEME_SVN_PROMPT_CLEAN=" ✓"

source ~/.local.sh
