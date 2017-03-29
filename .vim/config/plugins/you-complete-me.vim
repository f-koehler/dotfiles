" YouCompleteMe configuration
let g:ycm_auto_trigger = 1 " automatically trigger completion
let g:ycm_complete_in_comments = 0 " do not complete in comments
let g:ycm_complete_in_strings = 0 " do not complete in strings
let g:ycm_extra_conf_globlist = ["~/code/*"] " in these places .ycm_extra_conf.py files will be automatically loaded
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm.py" " set a global default .ycm_extra_conf.py file
let g:ycm_seed_identifiers_with_syntax = 1 " seed syntastic database with language keywords
let g:ycm_python_binary_path = "/usr/bin/python3"
