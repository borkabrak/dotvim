" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" Put 'console.log()' on the next line
nmap <leader>ll oconsole.log();<Esc>?(<cr>a

" Put 'console.log("%o", <cword>)' on the next line
nnoremap <leader>lo yiwoconsole.log("%o", ")<Esc>F"

