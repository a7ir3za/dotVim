""" vim: set et ts=3 sw=3 :"""
" myScripts.vim

let g:gitStat = '[]'
let g:gitMsg = ''
function! MyGitStatus()
  let g:gitStat = '['.system("git diff --no-color --stat -- ".shellescape(expand('%'))."|head -1|awk '{print$3,$4}'|tr -d '\n'").']'
  
  let g:gitMsg = trim(system("git branch --show-current --no-color"))
  if system("git status --porcelain|grep '^ M '") != '' 
     let g:gitMsg .= g:airline_symbols.dirty
  endif
  if system("git status -z --porcelain ".shellescape(expand("%"))) =~ '^?? '
     let g:gitMsg .= ' '.g:airline_symbols.notexists
  endif
  return g:gitMsg
endfunction

""" No need: would be called by consuming end
" autocmd FocusGained,BufEnter,BufWritePost *.go call GitStatus()
