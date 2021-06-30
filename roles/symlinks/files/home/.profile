# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# set vim to default editor
export EDITOR=vim

# expand paths
export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

export QT_API=pyside2
export GPG_TTY=$(tty)

if [ -d "$HOME/.scripts" ]; then
    export PATH="$HOME/.scripts:$PATH"
fi
