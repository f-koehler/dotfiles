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
set encoding=UTF-8

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

let mapleader = "\<Space>"

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog = "/home/fkoehler/.local/opt/anaconda3/envs/pyls/bin/python"
let g:python_host_prog = "/home/fkoehler/.local/opt/anaconda2/bin/python"

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'ryanoasis/vim-devicons'

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

Plug 'erichdongubler/vim-sublime-monokai'
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sbdchd/neoformat'
Plug 'stephpy/vim-yaml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
call plug#end()


let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" specify coc extensions
let g:coc_global_extensions = ["coc-css", "coc-gocode", "coc-html", "coc-json", "coc-omni", "coc-pairs", "coc-python", "coc-rls", "coc-sh", "coc-svg", "coc-tsserver", "coc-vimtex", "coc-yaml", "coc-yank"]

" use <tab> to navigate completions
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" add mappings for goto functions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" command to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <silent> <F2> :Format<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100

" set colorscheme
if has("syntax")
    " colorscheme sublimemonokai
    colorscheme molokai
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F8> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable devicons
let g:webdevicons_enable = 1

" enable in NERDTree
let g:webdevicons_enable_nerdtree = 1

" enable in airline
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" enable for ctrlp
let g:webdevicons_enable_ctrlp = 1

" enable for vim-startify
let g:webdevicons_enable_startify = 1


au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible


let g:tex_flavor='latex'
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
