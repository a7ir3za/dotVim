""" myScripts.vim

let g:gitStat = '[]'
let g:gitBranch = ''
function! GitStatus()
  let g:gitStat = '['.system("git diff --no-color --minimal --stat ".shellescape(expand('%'))."|head -1|awk '{print$3,$4}'|tr -d '\n'").']'
  let g:gitBranch = system("git branch --show-current|tr -d '\n'")
  return g:gitBranch
endfunction

""" No need: would be called by consuming end
" autocmd FocusGained,BufEnter,BufWritePost *.go call GitStatus()
