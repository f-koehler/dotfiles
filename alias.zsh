alias ll="ls -lh --color=always"

PREFIX="$HOME/.local/opt/miniconda3/envs/tools/bin"

if [ ! -x "$(command -v ansible)" ]; then
    if [ -x "$PREFIX/ansible" ]; then
        alias ansible="$PREFIX/ansible"
        alias ansible-config="$PREFIX/ansible"
        alias ansible-connection="$PREFIX/ansible-connection"
        alias ansible-console="$PREFIX/ansible"
        alias ansible-doc="$PREFIX/ansible"
        alias ansible-galaxy="$PREFIX/ansible"
        alias ansible-inventory="$PREFIX/ansible"
        alias ansible-playbook="$PREFIX/ansible"
        alias ansible-pull="$PREFIX/ansible"
        alias ansible-vault="$PREFIX/ansible"
    fi
fi

if [ ! -x "$(command -v git)" ]; then
    if [ -x "$PREFIX/git" ]; then
        alias git="$PREFIX/git"
        alias git-cvsserver="$PREFIX/git-cvsserver"
        alias gitk="$PREFIX/gitk"
        alias git-receive-pack="$PREFIX/git"
        alias git-shell="$PREFIX/git-shell"
        alias git-upload-archive="$PREFIX/git"
        alias git-upload-pack="$PREFIX/git"
    fi
fi

if [ ! -x "$(command -v wget)" ]; then
    if [ -x "$PREFIX/wget" ]; then
        alias wget="$PREFIX/wget"
    fi
fi

[ -e "$HOME/.local/bin/install_exa" ] && source "$HOME/.local/bin/install_exa"
if (( $+commands[exa] )); then
    alias ll="exa -lh"
    alias ls="exa"
else
    alias ll="ls -lh --color=always"
    alias ls="ls --color=always"
fi
