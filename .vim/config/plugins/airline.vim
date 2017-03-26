" airline configuration
set laststatus=2                               " give all windows a status line
let g:airline#extensions#branch#enabled       = 1 " fugitive/lawrencium integration
let g:airline#extensions#syntastic#enabled    = 1 " enable syntastic integration

" enhanced tabline
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_solarized_normal_green          = 1 " use green in normal mode
let g:airline_powerline_fonts                 = 1
let g:airline_left_sep                        = ''
let g:airline_right_sep                       = ''
