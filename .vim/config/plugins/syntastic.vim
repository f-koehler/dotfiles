" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1 " automatically populate location list with found errors
let g:syntastic_auto_loc_list = 1            " automatically open/close loc list
let g:syntastic_check_on_open = 1            " perform check if buffer is first opened
let g:syntastic_check_on_wq   = 0            " skip checks if buffer is written with :wq
let g:syntastic_aggregate_errors = 1         " aggregate messages from multiple checkers
let g:syntastic_python_python_exec = "/usr/bin/python3"
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"] }
