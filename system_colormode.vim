" Load System Color Mode from ~/.vim/system_colormode.txt
" dark/light

let g:light_colscheme = get(g:, 'light_colscheme', 'morning')
let g:dark_colscheme = get(g:, 'dark_colscheme', 'retrobox')

let s:current_bg = readfile($HOME . "/.vim/system_colormode.txt")[0]

function! SysColorMode()
    if s:current_bg == 'light'
      set bg=light
      execute "colorscheme " . g:light_colscheme
    else 
      set bg=dark
      execute "colorscheme " . g:dark_colscheme
    endif
endfunction

function! SysColorModeToggle()
  if s:current_bg == 'light'
    let s:current_bg = 'dark'
  else
    let s:current_bg = 'light'
  endif
  call SysColorMode()
endfunction

autocmd VimEnter * call SysColorMode()
