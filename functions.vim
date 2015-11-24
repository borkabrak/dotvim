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

" Append modeline after last line in buffer.
"   (Copied from 'http://vim.wikia.com/wiki/Modeline_magic')
"
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
"
" Interestingly, this will cause an error if the 'vim:' line in this function
" definition is too close to either end of this file, because vim thinks it
" is, itself, an actual modeline.  Fair enough, I guess?  I mean, how is it
" really supposed to know?  What else would you expect it to do?
function! AppendModeline()
  let l:modeline = printf(" vim: ft=%s set ts=%d sw=%d tw=%d %set :",
        \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

" Read the file aloud (if espeak is installed)
function! Read()
    call system("espeak -v f2 -s 140 -p 40 -f", expand(%))
endfunction

" Things to make vim enough of a word processor to be suitable for creative
" writing
" TODO: Enable restoration of earlier state.  (Save/restore a session file,
" but with only certain things saved?)
function! WritingMode(unset)

    " wrap long lines
    set wrap

    " A nice light-background color scheme
    colorscheme scheakur

    " Automatically format current paragraph when returning to normal mode
    imap <Esc> <Esc>mx{gq}'x

endfunction

function! FindInProject(pattern)
    echom "Searching for '" a:pattern "':"
    Ggrep a:pattern
endfunction

" Start a new executable script
function! MakeScript(type, name)
    echom "Making a new" a:type "script named" a:name
endfunction
