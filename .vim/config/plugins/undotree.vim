nnoremap <F5> :UndotreeToggle<cr>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
    silent call system('mkdir -p ' . &undodir)
endif
