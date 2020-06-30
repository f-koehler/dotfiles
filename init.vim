" show line numbers
set number

" mouse support
set mouse=a

" show cursor position
set ruler

" highlight current line
set cursorline

" always show statusline
set laststatus=2

" automatically set working directory
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" show two lines in command line
set cmdheight=2

" dont show |ins-completion-menu| messages
set shortmess+=c 

" always show signcolumns
set signcolumn=yes

" set encoding to UTF-8
set encoding=utf-8

" set font
set guifont=Ubuntu\ Mono\ Nerd\ Font:h11



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and <TAB>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand <TAB> to spaces
set expandtab

" # of spaces for (auto)indent
set shiftwidth=4

" number of spaces a <TAB> counts in editing operations
set softtabstop=4

" number of spaces a <TAB> counts
set tabstop=4

" use shiftwidth when pressing <TAB> at beginning of line
set smarttab

" copy indent from previous line
set autoindent

let g:mapleader = "\<Space>"
let g:maplocalleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" timeout
if !has("nvim") && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif

" assume fast terminal
if !has("ttyfast")
    set ttyfast
endif


" allow hidden buffers
set hidden

" enable filetype plugin
if has("autocmd")
    filetype plugin indent on
endif

" enable syntax plugin
if has("syntax")
    syntax enable
endif


let g:python3_host_prog = "/usr/bin/python"


call plug#begin('~/.cache/vim-plug')
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'Shougo/neco-vim'
    Plug 'SirVer/ultisnips'
    Plug 'TaDaa/vimade'
    Plug 'airblade/vim-gitgutter'
    Plug 'arcticicestudio/nord-vim'
    Plug 'bkad/CamelCaseMotion'
    Plug 'cespare/vim-toml'
    Plug 'chr4/nginx.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'dylanaraps/wal.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'erichdongubler/vim-sublime-monokai'
    Plug 'godlygeek/tabular'
    Plug 'honza/vim-snippets'
    Plug 'iamcco/markdown-preview.nvim'
    Plug 'jceb/vim-orgmode'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'kassio/neoterm'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'liuchengxu/vim-which-key'
    Plug 'liuchengxu/vista.vim'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc-neco'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'pboettch/vim-cmake-syntax'
    Plug 'pearofducks/ansible-vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sbdchd/neoformat'
    Plug 'stephpy/vim-yaml'
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-airline/vim-airline'
    Plug 'voldikss/vim-floaterm'
    Plug 'yggdroot/indentline'
call plug#end()
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor

let g:indentLine_char = "│"

" set colorscheme
if has("syntax")
    colorscheme nord
endif

au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

let g:tex_flavor='latex'
let g:tex_conceal=''
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
