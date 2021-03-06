" After the current line, insert a command to dd() on the variable under the cursor.
" (AHA-specific)
nnoremap <leader>dd mxlF$veyodd(");<Esc>`x

" Same, but just print_r
nnoremap <leader>dp mxlF$veyoprint_r(");<Esc>`x

" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99
