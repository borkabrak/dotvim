" GVIM Settings active only in gvim (and not the terminal)
" ========================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHEMES - Colorscheme suggestions that seem appropriate to the GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   * Colorschemes have two 'modes', depending on whether the option
"     'background' is set to 'light' or 'dark' (:set bg=light|dark)

" Examples I've liked
" ---------------------
"   Try one out by placing the cursor on its name and typing <leader>co.  If
"   the mapping isn't set, here it is:
"
"       nnoremap <leader>co mx"xyiW:colorscheme <C-R>x<CR>:echom "Color scheme: <C-R>x"<CR>`x
"

"   HIGH CONTRAST - better visibility
"   --------------------------------------
"   vividchalk
"   vibrantink
"   blackboard
"   lingodirector
"   literal_tango

"
"   LOW CONTRAST - easier on the eyes
"   -------------------------------------
"   wombat256
"   solarized
"   Monokai-chris
"   jellybeans
"   badwolf
"   tesla
"   codeschool
"   guardian " Like an old photograph
"   Tomorrow-Night

colorscheme tesla
" FONTS
" =======
"
"   Fonts in gvim are set by changing the option 'guifont'.  Spaces can be
"   included, but must be escaped with a backslash.  Font sizes are set by
"   appending <space>[size] to the font name.
"
"   To see the fonts available, use the system's font cache:
"       $ fc-list
"
"   For the curious, setting fonts in terminal vim is the job of the terminal,
"   and must be done with the terminal emulator.

" Open the font selection window
nnoremap <leader>font :set guifont=*<cr>

" Some interesting monospace fonts, many courtesy of fontspace.com:
" set guifont=M+\ 2m\ regular\ 12
" set guifont=Consola\ Mono\ 12
" set guifont=Tye\ Paloon\ 16
" set guifont=shaakmono\ 16
" set guifont=fn0t\ 17
" set guifont=TRAGIC\ BRK\ 8

" Set guifont to the designation under the cursor - (this pattern needs
" improvement -- make sure the cursor is on the first word of the font
" designation, but not the first letter of it.)
nnoremap <leader>gfn mxbv/[^\\]\s<cr>be"xy:setlocal guifont=x<cr>`x
" Reload settings
nnoremap <Leader>rc :source $MYVIMRC<cr>:source $MYGVIMRC<cr>:echom "$MYVIMRC and $MYGVIMRC reloaded."<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
