export EDITOR='vim'

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# user scripts
pathadd ~/.bin

# add cabal packages to PATH
pathadd ~/.cabal/bin

# add ruby packages to PATH
if [[ -f "/usr/bin/ruby" ]]; then
    GEMDIR="`ruby -e 'print Gem.user_dir'`/bin"
    pathadd $GEMDIR
fi

# set compilers
export CC=clang
export CXX=clang++

alias v="vim"
alias t="urxvtc"
alias hi="pygmentize -g"
alias open="xdg-open"
alias lolcow="cowsay | lolcat"

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
