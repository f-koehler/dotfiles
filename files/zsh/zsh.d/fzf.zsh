if [[ -d ${HOME}/.fzf/bin ]]; then
  if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
  fi
fi

if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
elif [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [[ -f ${HOME}/.fzf/shell/key-bindings.zsh ]]; then
  source ${HOME}/.fzf/shell/key-bindings.zsh
fi

if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
elif [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
elif [[ -f ${HOME}/.fzf/shell/completion.zsh ]]; then
  source ${HOME}/.fzf/shell/completion.zsh
fi

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'


# export FZF_DEFAULT_COMMAND='
#     (git ls-tree -r --name-only HEAD ||
#             find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
#                 sed s/^..//) 2> /dev/null'
# export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
# export FZF_CTRL_T_OPTS="--preview-window wrap --preview '
#     if [[ -f {} ]]; then
#         file --mime {} | grep -q \"text\/.*;\" && cat {} || (tput setaf 1; file --mime {})
#     elif [[ -d {} ]]; then
#         exa -l --color always {}
#     fi'"
#
# function plumber {
#     : | fzf --multi --preview='bash -c {q}' --preview-window=up:90%
# }
#
# function packages {
#     pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S
# }
#
# function aur_packages {
#     yay -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro yay -S
# }
