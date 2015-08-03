" we are using vim, prevent strange side effects
set nocompatible

" influence the behaviour of backspace, delete etc.
set backspace=indent,eol,start

" do loads of scanning for completion
set complete=.,w,b,u,U,t,i,d

" number of commands stored in history
set history=1000

" search while typing
set incsearch

" enable the mpouse
set mouse=a

" show line numbers
set number

" number of lines above and below the cursor
set scrolloff=5

" number of spaces in autoindent step
set shiftwidth=4

" highlight matching bracket
set showmatch

" number of spaces in a tab
set tabstop=4

" we have a fast terminal connection
"set ttyfast

" will be reactivated after vundle is done
filetype off

" line breaks at words
set linebreak

" tab switching and moving key shortcuts
noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
" nnoremap <silent> <C-S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" nnoremap <silent> <C-S-l> :execute 'silent! tabmove ' . tabpagenr()<CR>)

" show all buffers as tabs
let notabs = 1
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

" Load bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rhysd/vim-clang-format'

"set foldmethod=syntax

" color scheme
syntax enable
set background=dark
colorscheme solarized

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe configuration
" activate syntastic support
let g:ycm_register_as_syntastic_checker = 1
" collect more language keywords than provide via vim's keyword file
let g:ycm_seed_identifiers_with_syntax = 1
" global ycm_extra_conf
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm.py"
" turn auto triggering auto
let g:ycm_auto_trigger = 1
" no completion in comments and strings
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_extra_conf_globlist = ["~/code/*"]

" airline configuration
" show on start
set laststatus=2
" special symbols from the patched fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" enable lawrencium and fugitive plugin for repositories
let g:airline#extensions#branch#enabled = 1
" enable support for the syntastic syntax checker
let g:airline#extensions#syntastic#enabled = 1

" turn filetype recognition on
filetype plugin indent on

" indentation options
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" file specific indentation
autocmd FileType tex setlocal shiftwidth=2 tabstop=1
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType htm setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType py setlocal shiftwidth=4 tabstop=4
"autocmd BufRead,BufNewFile CMakeLists.txt,*.cmake,*.cmake.in setlocal shiftwidth=1 tabstop=1

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
