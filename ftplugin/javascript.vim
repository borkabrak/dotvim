" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

nmap <leader>ll oconsole.log("");<Esc>?""<cr>a
