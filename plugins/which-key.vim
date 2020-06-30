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


let g:which_key_map.t = {
            \ "name": "+terminal",
            \ "p": [":FloatermNew python", "python"],
            \ "t": [":FloatermToggle",     "toggle"],
            \ }

let g:which_key_map.l = {
            \ "name": "+lsp",
            \ "f" : ["<Plug>(coc-format-selected)", "format selected"],
            \ "F" : ["<Plug>(coc-format)",          "format"],
            \ }


" register key bindings
call which_key#register('<Space>', "g:which_key_map")
