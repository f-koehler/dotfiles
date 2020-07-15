" jump to existing buffer if available
let g:fzf_buffers_jump = 1

" set history directory
let g:fzf_history_dir = '~/.local/share/fzf-history'

" bindings to open files in splits
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-h': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }

" set fzf window layout
let g:fzf_layout = {
            \ 'window': {
            \    'width': 0.9,
            \    'height': 0.9,
            \    'xoffset' : 0.5,
            \    'yoffset' : 0.5,
            \    'border': 'sharp'
            \    }
            \ }

" set correct colors
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment']
            \ }


map <C-p> :Files<CR>
map <leader>b :Buffers<CR>
