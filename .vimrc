" basic configuration
set background=dark   " use dark background
set history=1000      " long command history
set incsearch         " search while typing
set linebreak         " when wrapping, break at words
set nocompatible      " be IMproved
set number            " line numbers
set scrolloff=5       " show 5 lines before after cursor
set showmatch         " hghlight matching braket
set ttyfast           " fast terminal connection
set wrap              " wrap long lines
syntax on             " enable syntax highlighting

" train yourself not to use the arrow keys
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>

" indentation options
filetype plugin indent on " recognize indentation of filetype
set autoindent            " copy indent to newline
set expandtab             " expand tab into spaces when using < and > command
set shiftwidth=4          " number of spaces used for indentation
set smartindent           " smarter indentation for C-like programs
set tabstop=4             " number of spaces that form a tab

" filetype specific indentation
autocmd FileType html,htm,xml,css setlocal shiftwidth=2 tabstop=2 " web files
autocmd FileType tex,sty setlocal shiftwidth=2 tabstop=1          " LaTeX files

" load plugins with vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-vinegar'
Bundle 'valloric/YouCompleteMe'
colorscheme solarized " use solarized color scheme

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1 " automatically populate location list with found errors
let g:syntastic_auto_loc_list = 1            " automatically open7close loc list
let g:syntastic_check_on_open = 1            " perform check if buffer is first opened
let g:syntastic_check_on_wq   = 0            " skip checks if buffer is written with :wq

" YouCompleteMe configuration
let g:ycm_seed_identifiers_with_syntax = 1 " seed syntastic database with language keywords
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm.py" " set a global default .ycm_extra_conf.py file
let g:ycm_auto_trigger = 1 " automatically trigger completion
let g:ycm_complete_in_comments = 0 " do not complete in comments
let g:ycm_complete_in_strings = 0 " do not complete in strings
let g:ycm_extra_conf_globlist = ["~/code/*"] " in these places .ycm_extra_conf.py files will be automatically loaded

" airline configuration
set laststatus=2                               " give all windwos a status line
let g:airline_powerline_fonts              = 1 " use the patched fonts
let g:airline#extensions#tabline#enabled   = 1 " use enhanced tabline
let g:airline#extensions#branch#enabled    = 1 " fugitive/lawrencium integration
let g:airline#extensions#syntastic#enabled = 1 " enable syntastic integration

" " influence the behaviour of backspace, delete etc.
" set backspace=indent,eol,start

" " do loads of scanning for completion
" set complete=.,w,b,u,U,t,i,d

" " will be reactivated after vundle is done
" filetype off

" " tab switching and moving key shortcuts
" noremap <C-j> :tabprevious<CR>
" noremap <C-k> :tabnext<CR>
" " nnoremap <silent> <C-S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" " nnoremap <silent> <C-S-l> :execute 'silent! tabmove ' . tabpagenr()<CR>)

" " show all buffers as tabs
" let notabs = 1
" nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

" " Load bundles
" Bundle 'tpope/vim-surround'
" Bundle 'rhysd/vim-clang-format'
