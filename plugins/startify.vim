let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:startify_bookmarks = [
            \ "~/code",
            \ ]

if has("nvim")
    let g:startify_custom_header = [
                \ '        _   __                _         ',
                \ '       / | / /__  ____ _   __(_)___ ___ ',
                \ '      /  |/ / _ \/ __ \ | / / / __ `__ \',
                \ '     / /|  /  __/ /_/ / |/ / / / / / / /',
                \ '    /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
                \ ]
else
    let g:startify_custom_header = [
                \ '     _    ___         ',
                \ '    | |  / (_)___ ___ ',
                \ '    | | / / / __ `__ \',
                \ '    | |/ / / / / / / /',
                \ '    |___/_/_/ /_/ /_/ ',
                \ ]
endif
