" specify coc extensions
let g:coc_global_extensions = [
            \ "coc-actions",
            \ "coc-clangd",
            \ "coc-cmake",
            \ "coc-css",
            \ "coc-cssmodules",
            \ "coc-dictionary",
            \ "coc-emoji",
            \ "coc-explorer",
            \ "coc-floaterm",
            \ "coc-git",
            \ "coc-go",
            \ "coc-highlight",
            \ "coc-html",
            \ "coc-json",
            \ "coc-julia",
            \ "coc-lists",
            \ "coc-markdownlint",
            \ "coc-marketplace",
            \ "coc-omnisharp",
            \ "coc-pairs",
            \ "coc-prettier",
            \ "coc-python",
            \ "coc-r-lsp",
            \ "coc-rls",
            \ "coc-sh",
            \ "coc-snippets",
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

" coc-pyright

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

" autocmd BufWrite *.py :CocCommand python.sortImports
