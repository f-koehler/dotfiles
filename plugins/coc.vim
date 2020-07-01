" specify coc extensions
let g:coc_global_extensions = [
            \ "coc-clangd",
            \ "coc-cmake",
            \ "coc-css",
            \ "coc-dictionary",
            \ "coc-git",
            \ "coc-go",
            \ "coc-highlight",
            \ "coc-html",
            \ "coc-json",
            \ "coc-markdownlint",
            \ "coc-omnisharp",
            \ "coc-pairs",
            \ "coc-prettier",
            \ "coc-pyright",
            \ "coc-python",
            \ "coc-r-lsp",
            \ "coc-rls",
            \ "coc-rust-analyzer",
            \ "coc-sh",
            \ "coc-snippets",
            \ "coc-svg",
            \ "coc-syntax",
            \ "coc-tag",
            \ "coc-texlab",
            \ "coc-tslint-plugin",
            \ "coc-tsserver",
            \ "coc-vimlsp",
            \ "coc-word",
            \ "coc-xml",
            \ "coc-yaml",
            \ "coc-yank",
            \ ]

" highlight current symbol
"autocmd CursorHold * silent call CocActionAsync('highlight')

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
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 JumpDefinition :call CocActionAsync('jumpDefinition')
nmap <silent> <F8> :Format<CR>
nmap <silent> <F12> :JumpDefinition<CR>
