HISTSIZE=1000000
SAVEHIST=1000000
HIST_STAMPS="yyyy-mm-dd"

if (( $+commands[zoxide] )); then
	eval "$(zoxide init zsh)"
fi

if (( $+commands[pip] )); then
	eval "$(pip completion --zsh)"
fi
