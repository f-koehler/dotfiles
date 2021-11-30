export ZSHD="$HOME/.zsh.d"

[ -f "$HOME/.profile" ] && source "$HOME/.profile"


setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none')
unsetopt BEEP

# completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# colors
autoload -Uz colors && colors

# history
setopt appendhistory
setopt histignorealldups

source "$ZSHD/functions.zsh"

zsh_add_file "aliases.zsh"
zsh_add_file "fzf.zsh"
zsh_add_file "exports.zsh"
zsh_add_file "keybindings.zsh"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

zsh_add_completion "esc/conda-zsh-completion" false

compinit
