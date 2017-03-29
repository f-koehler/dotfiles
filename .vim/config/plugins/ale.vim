let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
call airline#parts#define_function('ALE', 'ale#statusline#Status')
call airline#parts#define_condition('ALE', 'exists("*ale#statusline#Status")')
let g:airline_section_error = airline#section#create_right(['ALE'])
