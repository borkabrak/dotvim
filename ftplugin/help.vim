" When mapping commands meant for a particular filetype, set the first option
" to '<buffer>', so that it applies only as long as we're in the buffer that
" triggered the command.

" Enable Enter/Backspace to follow/return from links
nnoremap <buffer> <Return> <C-]>
nnoremap <buffer> <Backspace> <C-o>
