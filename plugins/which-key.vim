nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" create prefix dictionary
let g:which_key_map = {}

" do not use floating window
let g:which_key_use_floating_win = 0

" no status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map.g = {
            \ "name": "+git",
            \ "a": [":Git add %",     "stage current file"],
            \ "c": [":Git commit",    "commit"],
            \ "d": [":Git diff",      "diff"],
            \ "l": [":Git log",       "log"],
            \ "p": [":Git push",      "push"],
            \ "P": [":Git pull",      "pull"],
            \ "s": [":Git status",    "status"],
            \ }

let g:which_key_map.l = {
            \ "name": "+lsp",
            \ "a": ["<Plug>(coc-codeaction)",          "code action (line)"],
            \ "A": ["<Plug>(coc-codeaction-selected)", "code action (selection)"],
            \ "d": ["<Plug>(coc-definition)",          "definition"],
            \ "D": ["<Plug>(coc-declaration)",         "declaration"],
            \ "f": ["<Plug>(coc-format-selected)",     "format selected"],
            \ "F": ["<Plug>(coc-format)",              "format"],
            \ "v": [":Vista!!",                        "view tags"],
            \ }

let g:which_key_map.t = {
            \ "name": "+terminal",
            \ "p": [":FloatermNew python", "python"],
            \ "t": [":FloatermToggle",     "toggle"],
            \ }


" register key bindings
call which_key#register('<Space>', "g:which_key_map")
