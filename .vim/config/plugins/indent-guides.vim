" indent-guides config
let g:indent_guides_auto_colors           = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes     = ['help', 'nerdtree']
let g:indent_guides_guide_size            = 1
let g:indent_guides_start_level           = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#073642 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#073642 ctermbg=0
