" KEY MAPPINGS
"
"   I'm still debating whether mappings to functionality provided by a plugin
"   belongs here, or near the inclusion of the plugin (currently in vundlerc).
"   Right now, it's the latter.
" ==============


" DEALING WITH <ESCAPE>
" =======================
" <Esc> is used a LOT in vim.  But it's often stuffed away into a far away,
" difficult to reach corner of the keyboard.  There are several things that
" can be used for a solution:
" 
" * Remap <Esc> to something easier to hit a lot:
    inoremap jj <ESC>

"
"   * Alt+e
"       Terminal only. This could be <Alt> plus nearly anything, really ('e'
"       is just easy to remember).  In many terminals, this causes the Escape
"       character to be sent and then whatever character it was combined with.
"       This is properly a bit of a hack, but easy to do.
"
"   * ^[
"       This is the official alternative, and by definition provides exactly
"       the same behavior as <Escape>.  But it can be just as awkward to find,
"       depending on the keyboard and how good a typist the user is.
"
"   * Switch around CapsLock and Escape for the entire desktop.  This makes
"   <Escape> *much* easier to find, but makes CapsLock more difficult, and
"   affects every program on the system (for a given username).  If you're
"   down for that kind of commitment, try the following from a shell on X
"   Windows.  If you like it, put it in ~/.profile to make it permanent:
"
"       setxkbmap -option caps:swapescape


" Horizontally resize windows with Ctrl-Shift-h/l
nnoremap  >
nnoremap  <

" SESSION MANAGEMENT MAPPINGS:
"       NOTE: As of 2016-04-22, I'm using a plugin that may do this better.
"       Try out :SessionList
" ------------------------------------------------------------------------------
" manually save a session
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>
" recall the manually saved session
noremap <F6> :source ~/.vim/manual_session.vim<cr>
" recall the automatic session saved on last shutdown of vim
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" By default, apostrophe(') and backtick(`) are text objects that refer to the
" previous position by line and line/column, respectively.  Switch these
" around, as apostrophe is easier to use, but I generally want to refer to the
" exact cursor position more often than the entire line.
nnoremap ` '
nnoremap ' `
vnoremap ` '
vnoremap ' `

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

" " Switch enter-command-mode(:) with next-search-in-line(;).  Again, making
" the more commonly used command the easier one to use.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Autoformat with a single character (Q normally goes into 'ex' mode - like
" command mode, but it stays there until quit.  As I don't use that much, I
" don't mind losing it.)
map Q gq

" Page through open buffers
nnoremap <Tab>   :bn<cr>
nnoremap <S-Tab> :bp<cr>

" When yanking text in visual mode, keep the cursor from jumping to the
" beginning of the selection.
vnoremap y ygv<Esc>
vnoremap Y Ygv<Esc>

" Move between windows left/right
" (Especially useful with i.e. Nerdtree)
nnoremap  h
nnoremap  l

" Visually select whatever was just put/pasted.
nnoremap gp `[v`]

" [g]o to the [f]ile named under the cursor, whether it exists or not.
nnoremap gf :e <cfile><cr>
" The enter key, in normal mode, opens the file under the cursor only if it
" exists
nnoremap <cr> gf

" Format selected text into a table of columns
vnoremap  :!column -t<cr>

" Search for selected text (backwards and forwards)
vnoremap <silent>* y/0<cr>
vnoremap <silent># y?0<cr>

" ====================
" MAPLEADER MAPPINGS
" ====================
" 'mapleader' is used as a prefix to all sorts of user-defined keymappings.
" This makes bulk remapping easier, as we can move all <leader>-dependent
" mappings to a new prefix.

" First things first - decide what the leader character is.
let g:mapleader = ","

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

" drop buffer
nnoremap <Leader>d :bd<cr>

" quit
nnoremap <Leader>q :q<cr>

" reload config
nnoremap <Leader>rc :source $MYVIMRC<cr>:echo "$MYVIMRC reloaded (we hope)."<cr>

" Reload current file (in case something else changed it.  Prompts on unsaved
" changes.)
nnoremap <Leader>e :e<cr>

" Insert a signature block
nnoremap <Leader>@ oJon Carter<cr>borkabrak@gmail.com<Esc>

" Insert a human-readable timestamp
nnoremap <Leader>t :r!date +"\%F \%r"<cr>

" Insert just the date
nnoremap <Leader>D :r!date +"\%F"<cr>

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
