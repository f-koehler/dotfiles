[ ! -f ~/.zsh_clean_env ] && export > ~/.zsh_clean_env

export EDITOR="vim"

# aliases
source $HOME/.zsh.d/alias.zsh

# options
source $HOME/.zsh.d/options.zsh

# prompt
source $HOME/.zsh.d/prompt.zsh

# key bindings
source $HOME/.zsh.d/keybindings.zsh

# load plugins
if [ -d $HOME/.zsh/zsh-completions/src ]; then
  fpath=($HOME/.zsh/zsh-completions/src $fpath)
fi

if [ -d $HOME/.zsh/oh-my-zsh/plugins/ ]; then
  fpath=($HOME/.zsh/oh-my-zsh/plugins/cpanm $fpath)
  fpath=($HOME/.zsh/oh-my-zsh/plugins/pip $fpath)
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/fzf/key-bindings.zsh  ]; then
    source /usr/share/fzf/key-bindings.zsh
fi

autoload compinit && compinit

# useful commands
function copy-terminfo {
    infocmp $TERM | ssh "$@" "mkdir -p .terminfo && cat >/tmp/ti && tic /tmp/ti"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.local/bin:$PATH

source /opt/spack/share/spack/setup-env.sh

source /opt/intel/compilers_and_libraries_2019.3.199/linux/bin/compilervars.sh intel64

export MODULEPATH="$HOME/.local/share/modulefiles:$MODULEPATH"


if [ -f /etc/profile.d/modules.sh ]; then
    source /etc/profile.d/modules.sh
    if [ -f $HOME/.local/share/modulefiles/anaconda/3 ]; then
        module load anaconda/3
    fi
fi
alias anaconda3="module swap anaconda/2 anaconda/3"
alias anaconda2="module swap anaconda/3 anaconda/2"
export QT_API="pyside2"
