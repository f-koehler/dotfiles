" function that compiles YouCompleteMe
function! BuildYouCompleteMe(info)
    if a:info.status != 'unchanged' || a:info.force
        !python2 ./install.py --clang-completer --system-libclang --gocode-completer --tern-completer --omnisharp-completer --racer-completer
    endif
endfunction

let g:use_ale = g:is_vim8 || g:is_nvim

" load plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'MattesGroeger/vim-bookmarks'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'hecal3/vim-leader-guide'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/gv.vim'
Plug 'lervag/vimtex'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'valloric/YouCompleteMe', { 'do': function('BuildYouCompleteMe') }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if g:use_ale
    Plug 'w0rp/ale'
else
    Plug 'scrooloose/syntastic'
endif

call plug#end()

source $HOME/.vim/config/plugins/airline.vim
source $HOME/.vim/config/plugins/indent-guides.vim
source $HOME/.vim/config/plugins/undotree.vim
source $HOME/.vim/config/plugins/you-complete-me.vim

if g:use_ale
    source $HOME/.vim/config/plugins/ale.vim
else
    source $HOME/.vim/config/plugins/syntastic.vim
endif
