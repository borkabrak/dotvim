"================================================================
"
" FUNCTION DEFINITIONS
"
"================================================================

function! RemoveTrailingWhitespace()
    %s/\s\+$//e
endfunction

" Remove trailing whitespace, but confirm each removal
function! RemoveTrailingWhitespaceConfirm()
    %s/\s\+$//ce
endfunction

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

" Read the file aloud
function! Read()
    call system("espeak -v f2 -s 140 -p 40 -f", expand(%))
endfunction

