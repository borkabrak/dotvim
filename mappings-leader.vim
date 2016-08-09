" ====================
" LEADER MAPPINGS
" ====================
" 'mapleader' is used as a prefix to all sorts of user-defined keymappings.
" This allows, amongst other things, changing the leader key without having to
" edit every other mapping.  The leader key itself is set outside this file,
" before it is sourced.

" Go to most recently visited buffer
nnoremap <Leader><Space> 

" Open buffers by number
nnoremap <Leader>1 :b1<cr>
nnoremap <Leader>2 :b2<cr>
nnoremap <Leader>3 :b3<cr>
nnoremap <Leader>4 :b4<cr>
nnoremap <Leader>5 :b5<cr>
nnoremap <Leader>6 :b6<cr>
nnoremap <Leader>7 :b7<cr>
nnoremap <Leader>8 :b8<cr>
nnoremap <Leader>9 :b9<cr>

" List buffers
nnoremap <Leader>l :ls<cr>

" write file
nnoremap <Leader>w :w<cr>

" Drop the current buffer in a way that doesn't screw with an existing
" window layout such as NERDTree, by advancing to the next buffer before
" deleting the (now) previous one.
nnoremap  <leader>d :bn<CR>:bd#<CR>

" quit
nnoremap <Leader>q :q<cr>

" Reload current file (in case something else changed it.  Prompts on unsaved
" changes.)
nnoremap <Leader>e :e<cr>

" Insert a signature block
nnoremap <Leader>@ oJon Carter<cr>borkabrak@gmail.com<Esc>

" Insert a human-readable timestamp
nnoremap <Leader>t :r!date +"\%F \%r"<cr>

" Insert just the date
nnoremap <Leader>D :r!date +"\%F"<cr>kJ

" make current file executable - handy for new scripts
nnoremap <Leader>x :!chmod +x %<cr>

" set vim's current directory to that of the current file 
nnoremap <leader>cd :chdir %:h<cr>:pwd<cr>

" Underline the current line with various symbols.
" (Handy for things like Markdown )
"   * underline length matches the line above
"   * the new line is left in the anonymous register (so 'p' will put it again)
nnoremap <leader>= yypv$r=yy
nnoremap <leader>- yypv$r-yy
nnoremap <leader># yypv$r#yy
nnoremap <leader>" yypv$r"yy
nnoremap <leader>* yypv$r*yy
nnoremap <leader>U yypv$r━yy

" [i]nsert from the system clipboard - Copy anything, paste it here.
nnoremap <leader>i :set paste<cr>"+p:set nopaste<cr>

" Edit .vimrc
nnoremap <leader>v :e $MYVIMRC<cr>

" Open the link under the cursor in an external browser (w3m - console
" based)
nnoremap <leader>W :!x-www-browser <cfile><cr>

" Toggle highlighting searches
nnoremap <leader>h :set hlsearch!<cr>

" javascript help (NOTE: 'cl' conflicts with a mapping in nerdcommenter)
nnoremap <leader>cL oconsole.log("");<esc>hhi

" Call a function to append a modeline based on current settings
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Ctrl-C copies selected text to the system clipboard
vnoremap  "+y:let @*=@+<cr>:echom "Selection copied to system clipboard"<cr>
" Ctrl-X *cuts* to the system clipboard
vnoremap  "+x:let @*=@+<cr>:echom "Selection cut to system clipboard"<cr>

" Search only within selection (wraps around previously selected text only,
" but de-selects text in the process)
vnoremap // <Esc>/\%V

" Run the @r register as a macro, recursively
nnoremap <leader> :set nowrapscan<cr>:let @r.='@r'<cr>@r

" <Tab> in insert mode triggers vim's internal autocompletion.  You can stil
" insert tabs by using Shift-Tab
"
"   You know, it might be good to have <Tab> call a function/command that checks
"   context and only tries to complete if there is something TO complete..
inoremap <S-Tab> <C-P>

" Go to the definition of the current function in the code base.
"
"   This assumes a code base versioned by git, and requires the presence of
"   tpope's fugitive plugin.
"
"   The regex searches for 'function' followed by any non-zero whitespace,
"   followed by exactly the word under the cursor.
nnoremap <leader>gD :Ggrep 'function +\<<cword>\>'<cr>gg``:copen<cr>
nnoremap <leader>gF :Ggrep '\<<cword>\>'<cr>gg``:copen<cr>

" Anything that makes documentation easier is good.
nnoremap <leader>todo OTODO: <Esc>

" Open a file in a few common locations by getting you to the point where you
" just type the filename and enter.
nnoremap <leader>ev :edit ~/.vim/
nnoremap <leader>eh :edit ~/
nnoremap <leader>ez :edit ~/.zsh

" Uppercase the current line
nnoremap <leader>UU mx0gU$`x
" Lowercase the current line
nnoremap <leader>uu mx0gu$`x

" open :help on the word under the cursor (without moving the cursor)
nnoremap <leader>H mx"xyiw`x:help x<cr>

" Set the colorscheme to the WORD under the cursor (without moving the cursor)
nnoremap <leader>co mx"xyiW:colorscheme x<cr>:echom "Color scheme: x"<cr>`x

" Set background light/dark
" (This slows down the buffer list invoked by <leader>b)
nnoremap <leader>bgl :setlocal background=light<CR>
nnoremap <leader>bgd :setlocal background=dark<CR>
" If the user pauses, as if undecided, show the current setting.
nnoremap <leader>bg  :setlocal background?<CR>

" Trigger the session mgmt plugin
nnoremap <leader>ss :SessionSave<cr>
nnoremap <leader>sl :SessionList<cr>
