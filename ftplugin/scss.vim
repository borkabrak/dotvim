
" Compile the current scss to its corresponding css file
nnoremap <leader>C :!scss --sourcemap=none % %:t:r.css<cr>
