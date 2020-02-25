if [ -f ~/.fzf.zsh ]; then
	export FZF_DEFAULT_COMMAND='
      (git ls-tree -r --name-only HEAD ||
             find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
                   sed s/^..//) 2> /dev/null'
    export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
	export FZF_CTRL_T_OPTS="--preview-window wrap --preview '
		if [[ -f {} ]]; then
			file --mime {} | grep -q \"text\/.*;\" && cat {} || (tput setaf 1; file --mime {})
		elif [[ -d {} ]]; then
			exa -l --color always {}
		fi'"
    source ~/.fzf.zsh
fi

function plumber {
 	: | fzf --multi --preview='bash -c {q}' --preview-window=up:90%
}
