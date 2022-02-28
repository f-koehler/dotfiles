{% for alias in aliases %}
alias {{ alias[0] }}="{{ alias[1] }}"
{% endfor %}

if (( $+commands[z] )); then
  alias cd="z"
fi

{% if exa_found %}
alias ll="{{ exa_path }} -lh --color=auto --icons"
alias ls="{{ exa_path }} --color=auto --icons"
{% else %}
alias ll="ls -lh --color=always"
alias ls="ls --color=always"
{% endif %}

{% if bat_found %}
alias cat="{{ bat_path }} --color=always --italic-text=always --theme=Nord --plain"
{% endif %}

# # do not show snaps in df and lsblk output
# if (( $+command[snap] )); then
#     alias df="df -x squashfs"
#     alias lsblk="lsblk -e7"
# fi
