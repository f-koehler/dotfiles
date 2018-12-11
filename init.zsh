export EDITOR="vim"

# aliases
source $HOME/.zsh.d/alias.zsh

# options
source $HOME/.zsh.d/options.zsh

# prompt
source $HOME/.zsh.d/prompt.zsh

# key bindings
source $HOME/.zsh.d/keybindings.zsh

# load plugins
if [ -d $HOME/.zsh/zsh-completions/src ]; then
  fpath=($HOME/.zsh/zsh-completions/src $fpath)
fi

if [ -d $HOME/.zsh/oh-my-zsh/plugins/ ]; then
  fpath=($HOME/.zsh/oh-my-zsh/plugins/cpanm $fpath)
  fpath=($HOME/.zsh/oh-my-zsh/plugins/pip $fpath)
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/fzf/key-bindings.zsh  ]; then
    source /usr/share/fzf/key-bindings.zsh
fi

autoload compinit && compinit


# Anaconda3
if [ -f $HOME/.local/opt/anaconda3/bin/conda ]; then
    export PATH="$HOME/.local/opt/anaconda3/bin:$PATH"
fi

# Linuxbrew
function install_linuxbrew() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
}
if [ -f $HOME/.linuxbrew/bin/brew ]; then
    eval $(/home/fkoehler/.linuxbrew/bin/brew shellenv)
fi
