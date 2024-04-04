""" <My> config for vim-gitgutter
let g:airline#extensions#branch#custom_head = 'MyGitStatus'

let g:gitgutter_sign_allow_clobber = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
