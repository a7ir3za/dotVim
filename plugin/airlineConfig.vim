let g:airline_powerline_fonts=1

let g:airline_section_y='%{bufnr("%")}'
let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#tabline#buffer_idx_mode=1
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

let g:airline_detect_spelllang=1

if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
let g:airline_symbols.spell='Ꞩ'
let g:airline_symbols.paste='Þ'

set showtabline=2
set laststatus=2
set noshowmode

"let g:airline#extensions#branch#custom_head='MyGitStatus'
