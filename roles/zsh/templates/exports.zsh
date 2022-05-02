HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
HIST_STAMPS="yyyy-mm-dd"

{% if direnv_path %}
eval "$({{ direnv_path }} hook zsh)"
{% endif %}

{% if zoxide_path %}
eval "$({{ zoxide_path }} init zsh)"
{% endif %}

{% if starship_path %}
eval "$({{ starship_path }} init zsh)"
{% endif %}

if (( $+commands[pip] )); then
	eval "$(pip completion --zsh)"
fi

[[ -d ${HOME}/.npm-global/bin ]] && export PATH="${HOME}/.npm-global/bin:${PATH}"

[[ -d ${HOME}/.cargo/bin ]] && export PATH="${HOME}/.cargo/bin:${PATH}"

{% for var in environment_variables %}
export {{var}}="{{ environment_variables[var] }}"
{% endfor %}

eval "$(/opt/homebrew/bin/brew shellenv)"