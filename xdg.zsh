export XDG_CONFIG_HOME=$HOME/.config
if [ ! -d $XDG_CONFIG_HOME ]; then
    mkdir -p $XDG_CONFIG_HOME
fi

export XDG_CACHE_HOME=$HOME/.cache
if [ ! -d $XDG_CACHE_HOME ]; then
    mkdir -p $XDG_CACHE_HOME
fi

export XDG_DATA_HOME=$HOME/.local/share
if [ ! -d $XDG_DATA_HOME ]; then
    mkdir -p $XDG_DATA_HOME
fi
