
" Compile the current scss to its corresponding css file
nnoremap <leader>css :!scss --sourcemap=none % %:t:r.css<cr>
