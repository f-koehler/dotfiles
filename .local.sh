# set tools
export EDITOR=vim
export VISUAL=gvim

eval `dircolors ${HOME}/.dircolors`
alias ls="ls --color=always"
alias ll="ls -lh"

# add local software
export PATH=${HOME}/.local/bin:${PATH}

# add TeX Live paths
export PATH=/usr/local/texlive/2016/bin/x86_64-linux:${PATH}
export INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info:${INFOPATH}
export MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:${MANPATH}

# add Lmod paths
export PATH=/usr/local/lmod/lmod/libexec:${PATH}

alias hi="pygmentize -O style=vim -f terminal -g"
alias update_submodules="git submodule foreach --recursive 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'"

alias dotfiles='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'

function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract FILEPATH"
        return
    fi

    if [ ! -f $1 ] ; then
        echo "extract: File \"$1\" does not exist"
    fi

    case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: Unhandled archive type of file \"$1\"" ;;
    esac
}

function desktop {
    `grep '^Exec' $1 | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` &
}
