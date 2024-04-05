""" <My> config for vim-gitgutter
let g:airline#extensions#branch#custom_head = 'MyGitStatus'

let g:gitgutter_sign_allow_clobber = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 0
let g:gitgutter_floating_window_options = {'line':'cursor+1','moved':'any','padding':[],'border':[],'scrollbar':1}
