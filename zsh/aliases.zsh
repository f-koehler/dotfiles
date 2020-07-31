# Replace ls with exa if installed
# Change defaults for ls otherwise
if (( $+commands[exa] )); then
    alias ll="exa -lh --color=auto --icons"
    alias ls="exa --color=auto --icons"
else
    alias ll="ls -lh --color=always"
    alias ls="ls --color=always"
fi

# Replace cat with bat if installed
if (( $+commands[bat] )); then
    alias cat="bat --color=always --italic-text=always --theme=Nord --plain"
fi

# Abbreviate ranger if installed
if (( $+commands[ranger] )); then
    alias r="ranger"
fi

if (( $+commands[ikhal] )); then
    alias ikhal="ikhal -a personal -a work -a contact_birthdays"
fi

if (( $+commands[nproc] )); then
    alias ncore="nproc --all"
fi

if (( $+commands[nvim] )); then
    alias vim="nvim"
fi
