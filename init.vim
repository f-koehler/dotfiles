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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'

Plug 'erichdongubler/vim-sublime-monokai'
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'

if has("nvim")
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

" C/C++
if executable('cquery')
    let g:LanguageClient_serverCommands.c = ['cquery', '--log-file=/tmp/cquery-c.log', '--init={"cacheDirectory":"/tmp/cquery/"}']
    let g:LanguageClient_serverCommands.cpp = ['cquery', '--log-file=/tmp/cquery-cpp.log', '--init={"cacheDirectory":"/tmp/cquery/"}']
endif

" Fortran
if executable('fortls')
    let g:LanguageClient_serverCommands.fortran = ['fortls']
endif

" Javascript
if executable('javascript-typescript-stdio')
    let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
endif

" Pyrhon
if executable('pyls')
    let g:LanguageClient_serverCommands.python = ['pyls']
endif

nnoremap <F8> :call LanguageClient#textDocument_formatting()<CR>

nnoremap <C-p> :Files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ "auto_complete": v:true,
    \ "auto_complete_delay": 0,
    \ })

" set colorscheme
if has("syntax")
    " colorscheme sublimemonokai
    colorscheme molokai
endif
