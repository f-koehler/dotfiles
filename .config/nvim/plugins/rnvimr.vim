" replace netrw with ranger
let g:rnvimr_enable_ex = 1

" close ranger after selecting something
let g:rnvimr_enable_picker = 1 

" customize the layout of the ranger overlay
let g:rnvimr_layout = {
    \ 'relative': 'editor',
    \ 'width': float2nr(round(0.8 * &columns)),
    \ 'height': float2nr(round(0.8 * &lines)),
    \ 'col': float2nr(round(0.1 * &columns)),
    \ 'row': float2nr(round(0.1 * &lines)),
    \ 'style': 'minimal'
    \ }
