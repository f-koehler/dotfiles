# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export PS1="\[$(tput bold)\]\[\033[38;5;2m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;14m\]\\$\[$(tput sgr0)\] "

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

source .local.sh
