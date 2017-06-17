" be IMproved
set nocompatible

" basic configuration
set background=dark            " use dark background
set history=1000               " long command history
set incsearch                  " search while typing
set linebreak                  " when wrapping, break at words
set number                     " line numbers
set scrolloff=5                " show 5 lines before after cursor
set showmatch                  " hghlight matching braket
set ttyfast                    " fast terminal connection
set wrap                       " wrap long lines
syntax on                      " enable syntax highlighting
set backspace=indent,eol,start " modify backspace behaviour
set mouse=a
set listchars=tab:▸\ ,eol:¬,trail:␣
set list

" train yourself not to use the arrow keys
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>

" indentation options
filetype plugin on
filetype plugin indent on " recognize indentation of filetype
set autoindent            " copy indent to newline
set expandtab             " expand tab into spaces when using < and > command
set shiftwidth=4          " number of spaces used for indentation
set tabstop=4             " number of spaces that form a tab

" filetype specific indentation
autocmd FileType html,htm,xml,css setlocal shiftwidth=2 tabstop=2      " web files
" autocmd FileType tex,sty setlocal shiftwidth=2 tabstop=2 softtabstop=2 " LaTeX files

" filetype recognition
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.tikz set filetype=tex
autocmd BufRead,BufNewFile *.pgfplot set filetype=tex

source $HOME/.vim/config/features.vim
source $HOME/.vim/config/plugins.vim

" signify configuration
let g:signify_vcs_list = [ 'git' ]


" map <C-k> <C-w><Up>
" map <C-j> <C-w><Down>
" map <C-l> <C-w><Right>
" map <C-h> <C-w><Left>
map <C-h> :bp<cr>
map <C-l> :bn<cr>

set spelllang=en

" http://llvm.org/svn/llvm-project/cfe/tags/RELEASE_371/final/tools/clang-format/
map <C-K> :pyf $HOME/.vim/clang-format.py<cr>
imap <C-K> <c-o>:pyf $HOME/clang-format.py<cr>

set foldmethod=syntax
nnoremap <Space> za
set foldlevelstart=20

colorscheme nord
