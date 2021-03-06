let g:goyo_width = 100
let g:goyo_height = 95
let g:goyo_linenr = 0

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set nospell
  set noshowmode
  set noshowcmd
  :call CocAction('diagnosticToggle')
  :GitGutterDisable
  :CocCommand git.toggleGutters
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  :CocCommand git.toggleGutters
  :GitGutterEnable
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>z :Goyo<CR>
