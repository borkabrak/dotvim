" KEY MAPPINGS
"
"   I'm still debating whether mappings to functionality provided by a plugin
"   belongs here, or near the inclusion of the plugin (currently in vundlerc).
"   Right now, it's the latter.
" ==============

" Easier than flailing away at the <ESC> key all day..
" (later jon says you can also try Alt-E or ^[)
"
" You can also remap CapsLock and Escape, but you can't do it in vim.  Try this
" command from a shell or in ~/.profile:
"   setxkbmap -option caps:swapescape

inoremap jj <ESC>
inoremap JJ <ESC>
" Horizontally resize windows with Ctrl-Shift-h/l
nnoremap  >
nnoremap  <

" SESSION MANAGEMENT MAPPINGS:
" ------------------------------------------------------------------------------
" manually save a session
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>
" recall the manually saved session
noremap <F6> :source ~/.vim/manual_session.vim<cr>
" recall the automatic session saved on last shutdown of vim
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" By default,
"   Double apostrophe is 'go the cursor position's line'
"   Double backtick is 'go to the last cursor position's *character*'
" Switch these.
nnoremap ` '
nnoremap ' `
vnoremap ` '
vnoremap ' `

" " Switch enter-command-mode with next-search-in-line
" "   * In both normal and visual mode
" "   * Use the command window instead of the bizarrely emacs-y default 
" """""""""""""""""""""""""""""""""""""""""""""""""""
"     " Normal Mode
"     nnoremap ; q:i
"         "nnoremap ; :
"     nnoremap : ;
"     " Visual Mode
"     vnoremap ; q:i
"         "vnoremap ; :
"     vnoremap : ;
" set cmdwinheight=3

" Use the command window instead of the normal command line (and start in
" insert mode)
" nnoremap : q:i

" Switch ':' (command mode) and ';' (next 'f/t')
nnoremap ; :
nnoremap : ;
" Also for visual mode (I can't seem to combine normal and visual mode
" mappings)
vnoremap ; :
vnoremap : ;

" Make it pretty! (I don't need no stinkin' 'ex mode'..)
map Q gq

" Page through open buffers
nnoremap <Tab>   :bn<cr>
nnoremap <S-Tab> :bp<cr>

" Leave cursor where it was when yanking in visual mode!
vnoremap y ygv<Esc>
vnoremap Y Ygv<Esc>

" Move between windows left/right
" (Especially useful with i.e. Nerdtree)
nnoremap  h
nnoremap  l

" ================
" Leader mappings
" ================

" Go to most recently visited buffer
nnoremap <Leader><Space> 

" Numbered buffers
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

" drop buffer
nnoremap <Leader>d :bd<cr>

" quit easily
nnoremap <Leader>q :q<cr>

" reload vimrc files
" TODO: Resourcing vimrc like this doesn't actually check for a successful load
nnoremap <Leader>s :source $MYVIMRC<cr>:echo "vimrc reloaded (we hope)."<cr>

" Edit the vimrc file, changing the current directory to its location
nnoremap <leader>S :edit $MYVIMRC<cr>:cd %:h<cr>

" Reload current file
nnoremap <Leader>e :e<cr>

" Insert a signature
nnoremap <Leader>@ oJon Carter<cr>borkabrak@gmail.com<Esc>

" Insert a human-readable timestamp
nnoremap <Leader>t :r!date +"\%F \%r"<cr>

" Insert just the date
nnoremap <Leader>D :r!date +"\%F"<cr>

" run the current file
"nnoremap <Leader>r :!./%<cr>

" make current file executable
nnoremap <Leader>x :!chmod +x %<cr>

" set vim's current directory to that of the current file
nnoremap <leader>cd :chdir %:h<cr>:pwd<cr>

" Underline the current line with various symbols.
" (Very handy for, e.g. Markdown )
"   * underline length matches the line above
"   * the new line is left in the anonymous register (so 'p' will put it again)
nnoremap <leader>= yypv$r=yy
nnoremap <leader>- yypv$r-yy
nnoremap <leader># yypv$r#yy
nnoremap <leader>" yypv$r"yy
nnoremap <leader>* yypv$r*yy
nnoremap <leader>U yypv$r━yy

" Paste from system clipboard
nnoremap <leader>i :set paste<cr>"+p:set nopaste<cr>

" Select what was just pasted
nnoremap gp `[v`]

" 'gf' normally opens the file under the cursor.  This makes is so it
" also creates it if it doesn't exist
nnoremap gf :e <cfile><cr>
" The enter key, in normal mode, opens the file under the cursor only if it
" exists
nnoremap <cr> gf

" Edit .vimrc
nnoremap <leader>v :e $MYVIMRC<cr>

" Format highlighted text into nice columns
vnoremap  :!column -t<cr>

" Search for selected text (backwards and forwards)
vnoremap <silent>* y/0<cr>
vnoremap <silent># y?0<cr>

" Open the link under the cursor in an external browser (w3m - console
" based)
nnoremap <leader>W :!x-www-browser <cfile><cr>

" Toggle highlighting searches
nnoremap <leader>h :set hlsearch!<cr>

" javascript help (NOTE: 'cl' conflicts with a mapping in nerdcommenter)
nnoremap <leader>cL oconsole.log("");<esc>hhi

" Format the current paragraph
nnoremap <leader>Qp mt{gq}`t

" Call a function to append a modeline based on current settings
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Ctrl-A selects everything in the current buffer
" nnoremap <C-a> ggVG
" Ctrl-C copies selected text to the system clipboard
vnoremap  "+y:let @*=@+<cr>:echom "Selection copied to system clipboard"<cr>
" Ctrl-X *cuts* to the system clipboard
vnoremap  "+x:let @*=@+<cr>:echom "Selection moved to system clipboard"<cr>

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
"nnoremap <leader>gD :call FindInProject(expand('<cword>'))<cr>

" Anything that makes documentation easier is good.
nnoremap <leader>todo OTODO: <Esc>

nnoremap <leader>ev :edit ~/.vim/
nnoremap <leader>eh :edit ~/
nnoremap <leader>ez :edit ~/.z

" Uppercase the current line
nnoremap <leader>UU mx0gU$`x
" Lowercase the current line
nnoremap <leader>uu mx0gu$`x
