" WORD MAPPINGS 
""""""""""""""""
" A subset of <leader> mappings that are triggered by 'words', or short "
" abbreviations, mnemonics..  The prefix is..  " lets say.. <leader>, twice.  So
" they all start with:
"   <leader><leader>
"
" And are followed by a word.  "A word" here is pretty loosely defined -- it
" can be an abbreviation or anything that serves as an effective mnemonic for
" its referent behavior.

" [rm]: delete current file (this deletes the *file*, while the buffer stays
" open for recovery, et. al.)
nnoremap <leader><leader>rm :!rm %<cr>

" [r]eload [c]onfig - re-source .vimrc, et. al.
nnoremap <Leader><Leader>rc :source $MYVIMRC<cr>:echo "$MYVIMRC reloaded (we hope)."<cr>

" [w]ord [c]ount - append a line after the current one that displays counts
" for the current buffer as:
"
"       <lines> <words> <characters>
"
" Note: This reports info for the *buffer*, not the file, so it's not
" necessary to save first.
" -jdc/2016-06-07
nnoremap <leader><leader>wc mxggVG:!wc<cr>Vyu`xp

" [old] - Show recent documents
"
" * Show recently opened files in a new vertically-aligned window.  
" * Leave the cursor on the first filename, so that it can be immediately visited.
"
" Techically, these 'recent documents' are files with marks in viminfo.  More
" at ':help :old'
" BUG: after visiting a file,the buffer stays open.  These can stack up,
" leaving a lot of buffers open when you want to shut down vim, but they've
" unwritten changes, so they object and have to be forced.
"
" Might be better off making a function for this that this mapping can then
" call..
nnoremap <leader><leader>old :call RedirMessages('old', 'vnew')<cr>ggWWzz/
