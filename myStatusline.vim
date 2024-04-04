" Status Line {{{1
set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffChange#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='c')?'\ \ CMMAND\ ':''}
set statusline+=\ %n\          " buffer number
set statusline+=%#Visual#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%R              " readonly flag
set statusline+=%M              " modified [+] flag
set statusline+=%#CursorLine#
set statusline+=\ %t\           " short file name
set statusline+=%{g:gitStat}\ 
set statusline+=\ %3l:%-2c\     " line + column
set statusline+=%=              " right align
set statusline+=%#CursorLine#
set statusline+=\ %Y\           " file type
set statusline+=%#CursorIM#
set statusline+=%#Cursor#
set statusline+=\ %3p%%\        " percentage
