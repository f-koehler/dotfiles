ctrl-z-toggle () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

zle -N ctrl-z-toggle
bindkey '^Z' ctrl-z-toggle


bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
