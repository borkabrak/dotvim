" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" Quickly start a log message (optionally include the current word)
map <buffer> <leader>ll yiwoconsole.log();<Esc>F(pa
