" do not try to be compatible with vi
set nocompatible

" default indentation behavior
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent

" show line numbers
set number

if exists("g:vscode")
    nnoremap <silent> gc <Plug>VSCodeCommentary
    xnoremap <silent> gc <Plug>VSCodeCommentary
    onoremap <silent> gc <Plug>VSCodeCommentary
    nnoremap <silent> gcc <Plug>VSCodeCommentaryLine
else
    colorscheme codedark
end

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
