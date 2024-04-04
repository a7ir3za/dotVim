let g:airline_powerline_fonts = 1

set laststatus=2
set showtabline=2
set noshowmode

" fugitive: %{airline#util#wrap(airline#extensions#branch#get_head(),80)}
" gitgutter: %{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}
let g:airline_section_b = '%{g:airline_symbols.branch} %{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}'
let g:airline_section_y = '%{bufnr("%")}'
let g:airline_section_x = '%Y'

"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
