HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
HIST_STAMPS="yyyy-mm-dd"

if (( $+commands[direnv] )); then
	eval "$(direnv hook zsh)"
fi

if (( $+commands[zoxide] )); then
	eval "$(zoxide init zsh)"
fi

if (( $+commands[pip] )); then
	eval "$(pip completion --zsh)"
fi

[[ -f ~/.linuxbrew/bin/brew ]] && eval $(~/.linuxbrew/bin/brew shellenv)

[[ -d ${HOME}/.npm-global/bin ]] && export PATH="${HOME}/.npm-global/bin:${PATH}"

[[ -d ${HOME}/.cargo/bin ]] && export PATH="${HOME}/.cargo/bin:${PATH}"

export GPG_TTY="$(tty)"

[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
