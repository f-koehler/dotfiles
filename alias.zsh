if (( $+commands[exa] )); then
    alias ll="exa -lh"
    alias ls="exa"
else
    alias ll="ls -lh --color=always"
    alias ls="ls --color=always"
fi
