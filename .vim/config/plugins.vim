" function that compiles YouCompleteMe
function! BuildYouCompleteMe(info)
    if a:info.status != 'unchanged' || a:info.force
        !python2 ./install.py --clang-completer --system-libclang --gocode-completer --tern-completer --omnisharp-completer --racer-completer
    endif
endfunction

" load plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'valloric/YouCompleteMe', { 'do': function('BuildYouCompleteMe') }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
call plug#end()

source $HOME/.vim/config/plugins/airline.vim
source $HOME/.vim/config/plugins/indent-guides.vim
source $HOME/.vim/config/plugins/syntastic.vim
source $HOME/.vim/config/plugins/you-complete-me.vim
