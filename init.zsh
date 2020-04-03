# Initialize powerlevel10k, should always be at top of .zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path of the zsh config dir
export ZSHD="$HOME/.zsh.d"

# Path to oh-my-zsh installation.
export ZSH="$ZSHD/ohmyzsh"

# Path to oh-my-zsh customizations
ZSH_CUSTOM="$ZSHD/custom/"

# Load oh-my-zsh prompt theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# change format for history stamps
HIST_STAMPS="yyyy-mm-dd"


plugins=(
    cargo
    colored-man-pages
    django
    docker
    docker-compose
    fzf
    git
    github
    rust
    ufw
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    zsh-z
)

# Activate oh-my-zsh
source $ZSH/oh-my-zsh.sh



# User configuration

# Configure fzf plugin
export FZF_BASE=$HOME/.fzf

# Load my keybindings
source "$ZSHD/keybindings.zsh"

# Load my aliases
source "$ZSHD/aliases.zsh"

# Load my custom functions
source "$ZSHD/functions.zsh"

# Load my fzf tweaks
source "$ZSHD/fzf.zsh"

# Set editor to vim
export EDITOR=vim

if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
fi

export PATH="$HOME/.local/bin:$PATH"

# load p10k customizations
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f /etc/profile.d/modules.sh ]] && source /etc/profile.d/modules.sh

if [ -f /opt/spack/share/spack/setup-env.sh ]; then
    export SPACK_ROOT=/opt/spack
    source $SPACK_ROOT/share/spack/setup-env.sh
fi

[[ -f /opt/intel/compilers_and_libraries_2020.0.166/linux/bin/compilervars.sh ]] && source /opt/intel/compilers_and_libraries_2020.0.166/linux/bin/compilervars.sh -arch intel64 -platform linux &> /dev/null
export QT_API=pyside2
