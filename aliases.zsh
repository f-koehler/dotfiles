# Replace ls with exa if installed
# Change defaults for ls otherwise
if (( $+commands[exa] )); then
    alias ll="exa -lh"
    alias ls="exa"
else
    alias ll="ls -lh --color=always"
    alias ls="ls --color=always"
fi

# Replace cat with bat if installed
if (( $+commands[bat] )); then
    alias cat="bat --color=\"always\" --italic-text=\"always\" --plain"
fi
