# bash like word jumping
bindkey "^[Oc"    forward-word
bindkey "^[Od"    backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# make sure delete key is mapped correctly
bindkey "^[[3~"   delete-char
bindkey "^[3;5~"  delete-char

# fix home and end key
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
