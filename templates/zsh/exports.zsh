HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
HIST_STAMPS="yyyy-mm-dd"

eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"

{% if direnv_path is defined and direnv_path %}
eval "$({{ direnv_path }} hook zsh)"
{% endif %}

{% if zoxide_path is defined and zoxide_path %}
eval "$({{ zoxide_path }} init zsh)"
{% endif %}

{% if starship_path is defined and starship_path %}
eval "$({{ starship_path }} init zsh)"
{% endif %}

if (( $+commands[pip] )); then
	eval "$(pip completion --zsh)"
fi

[[ -d ${HOME}/.npm-global/bin ]] && export PATH="${HOME}/.npm-global/bin:${PATH}"

[[ -d ${HOME}/.cargo/bin ]] && export PATH="${HOME}/.cargo/bin:${PATH}"

export GPG_TTY="$(tty)"
