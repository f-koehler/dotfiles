# common variables
export EDITOR="vim"
export LESS="-R"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.zsh_history"

# aliases
alias v='vim'
alias ll="ls -lh --color=always"
alias ls="ls --color=always"
alias dotfiles='git --git-dir ~/.dotfiles/ --work-tree=$HOME'
alias etcfiles='sudo git --git-dir ~/.etcfiles/ --work-tree=/etc'
(( $+commands[pygmentize] )) && alias hi="pygmentize -O style=vim -f terminal -g"

# manually set paths
TEXLIVE_ROOT="/usr/local/texlive/2016"
if [ -d $TEXLIVE_ROOT ]; then
    PATH="$TEXLIVE_ROOT/bin/x86_64-linux:${PATH}"
    INFOPATH="$TEXLIVE_ROOT/texmf-dist/doc/info:${INFOPATH}"
    MANPATH="$TEXLIVE_ROOT/texmf-dist/doc/man:${MANPATH}"
    alias tlmgr="sudo tlmgr"
    alias tlupdate="tlmgr update --self --all"
fi

# options
setopt auto_cd
setopt complete_aliases
setopt correct
setopt extendedglob
setopt hashlistall
setopt hist_ignore_space
setopt nomatch
setopt prompt_subst
setopt pushd_ignore_dups
unsetopt beep

# load plugins
[[ ! -d $HOME/.zsh/zsh-completions ]] && git submodule upate --init --recursive

fpath=($HOME/.zsh/zsh-completions/src $fpath)
fpath=($HOME/.zsh/oh-my-zsh/plugins/cpanm $fpath)
fpath=($HOME/.zsh/oh-my-zsh/plugins/pip $fpath)

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.zsh/oh-my-zsh/plugins/nmap/nmap.plugin.zsh"
autoload compinit && compinit
autoload colors && colors
autoload -Uz vcs_info

# configure completion
zstyle ':compinstall' filename "$HOME/.zshrc"
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.pdf' '*.tar.*' '*.o' '.pyc'
zstyle ':completion:*:commands' rehash 1
zstyle ':completion::(^approximate):*:functions' ignored-patterns '_*'

# fix zsh-autosuggestion for solarized theme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# bash like word jumping
bindkey "^[Oc"    forward-word
bindkey "^[Od"    backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# make sure delete key is mapped correctly
bindkey    "^[[3~"  delete-char
bindkey    "^[3;5~" delete-char

# fix home and end key
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
