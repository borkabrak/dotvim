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
"       Terminal only. This could be <Alt> plus nearly anything, really -- 'e'
"       is just easy to remember.  In many terminals, this causes the Escape
"       character to be sent and then whatever character it was combined with.
"       This is properly a bit of a hack, but easy to do on most keyboards.
"
"   * ^[ ( Ctrl+[ )
"       This is the official alternative, and by definition provides exactly
"       the same behavior as <Escape>.  But it can be just as awkward to find,
"       depending on the keyboard and how good a typist the user is.
"
"   * Switch around CapsLock and Escape for the entire desktop.  This makes
"   <Escape> *much* easier to find, but makes CapsLock more difficult, and
"   affects every program on the system (well, the windowing system, and for a
"   given username).  If you're down for that kind of commitment, try running
"   the following from a shell on X Windows.  If you like it, put it in
"   ~/.profile to make it permanent:
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

" Ctrl-S saves the current file, of course.  :)
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a

" PP - Justify the current paragraph without moving the cursor
nnoremap PP mxgqap`x

" gPP - Justify *every* paragraph without moving the cursor
nnoremap gPP mxgggqG`xzz


" <LEADER> MAPPINGS
""""""""""""""""""""
    " First, set the <leader> character.
    let g:mapleader = ","
    " Then load the mappings
    runtime! mappings-leader.vim


" LOAD WORD MAPPINGS
""""""""""""""""""""
runtime! mappings-word.vim
