if (( $+commands[exa] )); then
    alias ll="exa -lh"
    alias ls="exa"
else
    alias ll="ls -lh --color=always"
    alias ls="ls --color=always"
fi

if (( $+commands[bat] )); then
    alias cat="bat --color=\"always\" --italic-text=\"always\" --plain"
fi

if (( $+commands[pikaur] )); then
    alias pacman="pikaur"
fi

alias commits-since-tag="git log $(git describe --tags --abbrev=0)..HEAD --oneline"
