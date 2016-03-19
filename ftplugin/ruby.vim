" Settings active only for 'ruby' filetypes
"""""""""""""""""""""""""""""""""""""""""""

" Change back and forth between ruby's block delimiter forms
"------------------------------------------------------------
" [b]races to(2) [d]o/[e]nd - change the next 'do/end' to curly braces '{}'
nnoremap <leader>b2de mx/{<CR>xido<Esc>/}<CR>xiend<Esc>`x
" [d]o/[e]nd to(2) [b]races - change the next pair of curly braces to 'do/end'
nnoremap <leader>de2b mx/do<CR>cw{<Esc>/end<CR>cw}<Esc>`x
