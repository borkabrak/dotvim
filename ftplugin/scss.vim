" Invoke SCSS parser
""""""""""""""""""""
" Normal mode: translate the current buffer from SCSS into CSS in-place.
nnoremap <leader>css mpggVG:'<,'>!scss -s<cr>`p
" Visual mode: translate just the selected portion.
vnoremap <leader>css :'<,'>!scss -s<cr>
