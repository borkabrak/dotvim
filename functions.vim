"================================================================
"
" FUNCTION DEFINITIONS
"
"================================================================

" Functions for dealing with trailing whitespace
"   Yes, yes.  This should be refactored.
"   But for now..  *shrug*
function! RemoveTrailingWhitespace()
    %s/\s\+$//e
endfunction

function! RemoveTrailingWhitespaceVisual()
    '<,'>s/\s\+$//e
endfunction

" Remove trailing whitespace, but confirm each removal
function! RemoveTrailingWhitespaceConfirm()
    %s/\s\+$//ce
endfunction

function! RemoveTrailingWhitespaceVisualConfirm()
    '<,'>s/\s\+$//ce
endfunction

" Note the CAPTIAL W for the confirm variants, and the visual ones.. well,
" they're what happens in visual mode.
nnoremap <leader>rtw :call RemoveTrailingWhitespace()<cr>
nnoremap <leader>rtW :call RemoveTrailingWhitespaceConfirm()<cr>
vnoremap <leader>rtw :call RemoveTrailingWhitespaceVisual()<cr>
vnoremap <leader>rtW :call RemoveTrailingWhitespaceVisualConfirm()<cr>

"================================================================
" NOTE: This is still a bit experimental
" Project-wide grep, with results managed in the quickfix window
" (Make sure you're in the top dir when you do this)
" For performance reasons, let's have some filetype-specific funcs
function! ProjectGrepPHP(pattern)
    echom "Grepping for "
    echom a:pattern
    echom ".."
    vimgrep a:pattern **/*.php | copen 5
endfunction
"================================================================

