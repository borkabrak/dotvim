" Code Folding
" syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
" setlocal foldmethod=syntax
" setlocal foldlevel=99

" Quickly start a log message (optionally include the current word)
map <buffer> <leader>ll yiwoconsole.log();<Esc>F(pa



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following is technically supposed to go just for JSON, but I haven't figured out
" how to get *.json to set filetype JSON, with the setup I've got going on
" right now.  Bored trying; I'll do it later.  :-/
"
" consider 'foldclose'
"

" Fold on each brace pair
" * TIPS:  Once all braces are folded, 'zr'/'zm' can be used to go up and down
" the hierarchy by manipulating 'foldlevel' (try it out for better understanding)
" =======================
    " Prepare to manually create folds
    setlocal foldmethod=manual

    " macro to create a fold across the '{' and its matching '}' that lies
    " nearest after the cursor
    call setreg('f', '/{v%zfzo@f')

    "Create mapping to run @f (wrapscan must be off for it to terminate)
    nnoremap <buffer> <leader>mf :set nowrapscan<cr>@f
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
