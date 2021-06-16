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

# Replace grep with ripgrep if installed
if (( $+commands[rg] )); then
    alias grep="rg"
fi

# Replace du with dust if installed
if (( $+commands[dust] )); then
    alias du="dust"
fi

# Replace cloc with tokei if installed
if (( $+commands[tokei] )); then
    alias cloc="tokei"
fi

# Replace ps with procs if installed
if (( $+commands[procs] )); then
    alias ps="procs"
fi

# Replace sed with sd if installed
if (( $+commands[sd] )); then
    alias sed="sd"
fi

# Replace top/htop with bottom if installed
if (( $+commands[btm] )); then
    alias top="btm"
    alias htop="btm"
fi

# do not show snaps in df and lsblk output
if (( $+command[snap] )); then
    alias df="df -x squashfs"
    alias lsblk="lsblk -e7"
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


alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
