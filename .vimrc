" vim: foldmethod=marker

" General {{{1
let mapleader='\'

set autowrite
set encoding=utf-8
set clipboard=unnamed
syntax on

set number
set nowrapscan
filetype indent plugin on
set hidden
command! -nargs=* Wrap set wrap linebreak nolist
set foldcolumn=5
set ts=2 sts=2 sw=2 expandtab "Default Tab/Whitespace"

"colorscheme default 
"colorscheme morning
colorscheme retrobox 

"highlight FoldColumn ctermbg=Black ctermfg=Grey
"highlight Folded ctermfg=Black
"highlight MatchParen ctermbg=12

"set matchpairs+=<:>

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC

	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType python setlocal ts=3 sts=3 sw=3 expandtab
	autocmd FileType go setlocal ts=2 sts=2 sw=2 expandtab

endif

set listchars=eol:$,space:.,tab:»-
nmap § :set list!<CR>
map <Leader>ew :e <C-R>=expand("%:p:h")."/"<CR>

" Language {{{1
" Python {{{2
if has("autocmd")
	autocmd BufNewFile,BufRead *.py set ts=3 sts=3 sw=3 expandtab autoindent fileformat=unix
endif	

" Plugins {{{1
" NetRW {{{2
let g:netrw_liststyle=3
let g:netrw_banner=1
let g:netrw_browse_split=0

" VimGo {{{2
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1
let g:go_highlight_types=1
let g:go_metalinter_autosave=1
let g:go_auto_type_info=1
let g:go_auto_sameids=0
let g:go_def_mode='gopls'
let g:go_def_reuse_buffer=1
let g:go_info_mode='gopls'
let g:go_decls_include="func,type"
let g:go_doc_popup_window=0
let g:go_term_enabled=1
let g:go_term_mode='split'
let g:go_term_reuse=1
let g:go_term_close_on_exit=0
let g:go_term_height=11
let g:go_jump_to_error=1
let g:go_test_show_name=1

if has("autocmd")
	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')

	"autocmd FileType go nmap <Leader>d <Plug>(go-doc) "normal K
	autocmd FileType go nmap <Leader>h <Plug>(go-decls)
	autocmd FileType go nmap <Leader>c <plug>(go-coverage-toggle)
	autocmd FileType go nmap <Leader>r <Plug>(go-run)
	autocmd FileType go nmap <Leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>j <plug>(go-test-func)
	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <Leader>f <Plug>(go-fmt)
  autocmd Filetype go nmap <Leader>w <plug>(go-doc-browser)
  autocmd Filetype go nmap <Leader>y <plug>(go-sameids)
  autocmd Filetype go nmap <Leader>m <plug>(go-implements)
  autocmd Filetype go nmap <Leader>e <plug>(go-iferr)

  autocmd FileType go nmap <leader>b :<C-u>call <SID>BuildGoFiles()<CR>

  autocmd BufNewFile,BufRead *.go setlocal tabstop=2 shiftwidth=2

  autocmd FileType go setlocal omnifunc=go#complete#Complete
  autocmd FileType go setlocal completeopt=longest,menuone

  autocmd Filetype go iabbrev ftst func Test(t *testing.T) {<CR>}
endif

function! s:BuildGoFiles()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let gitStat = '[]'
function! GitStatus()
  let gitStat = '['.system("git diff --minimal --stat ".shellescape(expand('%'))."|head -1|awk '{print$3,$4}'|tr -d '\n'").']'
endfunction

if has("autocmd")
  autocmd BufEnter,BufWritePost *.go call GitStatus()
endif

" Status Line {{{1
set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%R              " readonly flag
set statusline+=%M              " modified [+] flag
set statusline+=%#CursorLine#
set statusline+=\ %t\           " short file name
set statusline+=%(%{gitStat}%)
set statusline+=\ %3l:%-2c\     " line + column
set statusline+=%=              " right align
set statusline+=%#CursorLine#
set statusline+=\ %Y\           " file type
set statusline+=%#CursorIM#
set statusline+=%#Cursor#
set statusline+=\ %3p%%\        " percentage
