[ ! -f ~/.zsh_clean_env ] && export > ~/.zsh_clean_env

export EDITOR="vim"

# aliases
source $HOME/.zsh.d/alias.zsh

# options
source $HOME/.zsh.d/options.zsh

# key bindings
source $HOME/.zsh.d/keybindings.zsh

# load plugins
if [ -d $HOME/.zsh.d/zsh-completions/src ]; then
  fpath=($HOME/.zsh.d/zsh-completions/src $fpath)
fi

if [ -d $HOME/.zsh.d/oh-my-zsh/plugins/ ]; then
  # fpath=($HOME/.zsh.d/oh-my-zsh/plugins/cpanm $fpath)
  # fpath=($HOME/.zsh.d/oh-my-zsh/plugins/pip $fpath)
  source $HOME/.zsh.d/oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
  source $HOME/.zsh.d/oh-my-zsh/plugins/systemd/systemd.plugin.zsh
  source $HOME/.zsh.d/oh-my-zsh/plugins/z/z.plugin.zsh
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-syntax-highlighting.zsh
fi

autoload compinit && compinit

# prompt
source $HOME/.zsh.d/prompt.zsh

# useful commands
function copy-terminfo {
    infocmp $TERM | ssh "$@" "mkdir -p .terminfo && cat >/tmp/ti && tic /tmp/ti"
}

function update-zsh-modules {
    OLD_PWD=`pwd`
    for module in oh-my-zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting; do
        cd $HOME/.zsh.d/$module/
        git pull origin master
    done
    cd $OLD_PWD
}


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

export PATH=$HOME/.local/bin:$PATH

source /opt/spack/share/spack/setup-env.sh

source /opt/intel/compilers_and_libraries_2019.4.243/linux/bin/compilervars.sh intel64

export MODULEPATH="$HOME/.local/share/modulefiles:$MODULEPATH"


if [ -f /etc/profile.d/modules.sh ]; then
    source /etc/profile.d/modules.sh
    if [ -f $HOME/.local/share/modulefiles/anaconda/3 ]; then
        module load anaconda/3
    fi
fi
export QT_API="pyside2"

source $HOME/.zsh.d/android.zsh
source $HOME/.zsh.d/cocos2d-x.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fkoehler/.local/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fkoehler/.local/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fkoehler/.local/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fkoehler/.local/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

