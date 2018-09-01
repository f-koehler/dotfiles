export EDITOR="vim"

# aliases
source $HOME/.zsh.d/alias.zsh

# options
source $HOME/.zsh.d/options.zsh

# prompt
source $HOME/.zsh.d/prompt.zsh

# load plugins
if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/fzf/key-bindings.zsh  ]; then
    source /usr/share/fzf/key-bindings.zsh
fi
