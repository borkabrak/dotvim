" VIM CONFIGURATION
" ===================
"
" TODO:
" =======
"
" * Consider converting from Vundle to VimPlug
"
" * Check out tpope's plugins 'sensible' and 'sleuth'
"
" * Detect and load AHA-specific settings dynamically
"
" * Resourcing vimrc like this doesn't actually check for a successful load
"
" GENERAL TIPS:
" ======================================================================
"   :earlier and :later walk through changes to the buffer with respect
"   to time.
"
"   gd - goto the DECLARATION of the variable under the cursor
"   gv - reselects last visual selection
"   gi - return to last insert mode location

"   ga - show ASCII value of character under cursor (cf. g8)
"   gD - go to definition of word under the cursor

" OPTIONS:
" ==============================================================================
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Neovim doesn't require this, and indeed seems to flag it as an error.  :-/
" I'm leaving it, though, because it doesn't actually cause any problems, and
" I still might want to move back to regular vim at some point.
set nocompatible

" =======================================================================
" NOTE: Set mapleader BEFORE using it in mappings.
" You wouldn't think this needs to be said, but it's already bitten me.
" Twice.  :-D
" =======================================================================
let g:mapleader = ","

source ~/.vim/vundlerc.vim

" =====
" FOR SOME REASON, THESE CALLS TO UNITE FUNCTIONS CANNOT GO INSIDE VUNDLE SETUP:

" Set Unite to act sorta like CtrlP:
" ( Alternative prompt char: »)
call unite#custom#profile('default', 'context', {
\   'winheight': 10,
\   'direction': 'botright',
\   'prompt': '❯ ',
\ })

" Don't suggest certain file types to edit
call unite#custom#source('file_rec,file_rec/async',
    \ 'ignore_pattern', '.*\.exe$\|.*\.dll\|.*\.so')

" Tell Unite to ignore the same globs the rest of vim does
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs', split(&wildignore, ','))

" let g:unite_ignore_source_files = ['*.dll']
" == END UNITE POST-VUNDLE CONFIG ===

" Enable unicode (once)
if &encoding !~ '^utf-8'
    set encoding=utf-8
endif

" Use 256 colors
set t_Co=256

" Allow hidden buffers (so you don't have to save all changes before so much
" as *looking* at another buffer)
set hidden

" Indent/outdent n spaces
set shiftwidth=4

" Tabs are n spaces
set tabstop=4

" Tabs are *spaces*, instead of tab character
set expandtab

" How to show tab characters when `:set list` is used
set listchars+=tab:]-,trail:•,extends:❯,precedes:❮

" Indent/outdent to the next tabstop
set shiftround

set smarttab

" ignore case in searches...
set ignorecase
" ...unless the pattern has uppercase characters or '\C' in it.
set smartcase

set autoindent
set smartindent
set incsearch

set undofile
set undodir=$HOME/.vim/undo/
set undolevels=1000
set laststatus=2

" Set the height of the command window
set cmdwinheight=1

" Don't wrap lines on the WINDOW (mismatching it with the buffer)
set nowrap

" Maintain a few lines of context around the cursor
set scrolloff=3

" keep n lines of command history
set history=500

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Automatically reload externally changed files
set autoread

" Keep all swapfiles in a single, separate directory (avoid polluting other dirs with .swp files)
set directory=$HOME/.vim/swap/,~/tmp,/var/tmp,/tmp
" Backup files, too
set backupdir=$HOME/.vim/backup

" Better autocompletion
set wildmenu

" Which keys are allowed to wrap over to the next/previous lines?
set whichwrap=b,s,[,],<,>,~,h,l

" Reserve the ALT key for the windowing system (can't make mappings with it in vim this way)
set winaltkeys=yes

" Allow virtual editing in Visual block mode.
set virtualedit=block

" What to remember between sessions
set viminfo+=%

" Abbreviate various messages
set shortmess=atToOs

" MAPPINGS:
" ==============================================================================
" Easier than flailing away at the <ESC> key all day..
" (later jon says you can also try Alt-E or ^[)
inoremap jj <ESC>
inoremap JJ <ESC>

" Use the command window instead of the normal command line (and start in
" insert mode)
" nnoremap : q:i

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

" Also switch ':' and ';' (command mode and next 'f')
" (This'll take a little getting used to.  Maybe don't remap the real colon until I do.)
nnoremap ; :
nnoremap : ;

" Switch colon and semi-colon for visual mode
vnoremap ; :
vnoremap : ;

" Easier to follow links (e.g., in help files) and go back
"   This just ended up confusing me.  Open them up for other mappings.
"nnoremap <CR> <C-]>
"nnoremap <BS> <C-T>

" <Enter> inserts a line, even in normal mode
" nnoremap <CR> i<CR><ESC>

" Backspacing over a character deletes it, even in normal mode
" nnoremap <BS> X

" Make it pretty! (I don't need no stinkin' 'ex mode'..)
map Q gq

" Make p in Visual mode replace the selected text with the "* register.
" (Which mirrors the system clipboard)
" vnoremap p <Esc>:let current_reg = @*<CR>gvs<C-R>=current_reg<CR><Esc>

" Walk through buffers
" nnoremap <Tab>   :bn<cr>
" nnoremap <S-Tab> :bp<cr>
nnoremap <C-j> :bn<cr>
nnoremap <C-k> :bp<cr>

" switch current directory to where the current file is.
nnoremap cd :chdir %:h<cr>:pwd<cr>

" Leave cursor where it was when yanking!
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

" Reload current file
nnoremap <Leader>e :e<cr>

" Insert a signature
nnoremap <Leader>@ oJon Carter<cr>borkabrak@gmail.com<Esc>

" Insert a human-readable timestamp
nnoremap <Leader>t :r!date +"\%F \%r"<cr>

" Insert just the date
nnoremap <Leader>D :r!date +"\%F"<cr>

" run the current file
nnoremap <Leader>r :!./%<cr>

" make current file executable
nnoremap <Leader>x :!chmod +x %<cr>

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

" 'Save as':
"   Write to a filename (prompted for) and switch to it.
nnoremap <leader>S :sav

" Paste from system clipboard
nnoremap <leader>i :set paste<cr>"*p:set nopaste<cr>

" Select what was just pasted
nnoremap gp `[v`]

" 'gf' normally opens the file under the cursor.  This makes is so it
" also creates it if it doesn't exist
nnoremap gf :e <cfile><cr>

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

syntax enable

source ~/.vim/colorscheme.vim

runtime! macros/matchit.vim

" Read man pages within vim (<leader>K)
runtime! ftplugin/man.vim


" ==============================================================================
" AUTOCOMMANDS:
" ==============================================================================
" Set the textwidth for text files
autocmd FileType text setlocal textwidth=78

" textwidth for markdown files
autocmd FileType markdown setlocal textwidth=78

" Save vim state info on shutdown
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

set number
set nohlsearch

" Do not create a bunch of backup files ending in tilde. (Is this a
" Windows-specific thing?)
" set nobackup
" set nowritebackup

" Highlight trailing whitespace as an error (:help match, matchadd,
" matchdelete for finer control here)
match ErrorMsg '\s\+$'

function! RemoveTrailingWhitespace()
    %s/\s\+$//e
endfunction

" Remove trailing whitespace, but confirm each removal
function! RemoveTrailingWhitespaceConfirm()
    %s/\s\+$//ce
endfunction

" :Sudosave will write the file using sudo, if user is a sudoer
command! Sudosave write !sudo tee % > /dev/null
" :W is an alias for :Sudosave
cnoreabbrev W Sudosave

" A couple of mapping to step through quickfix results easier:
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprev<cr>
" duplicate, yeah, but I keep trying it..
nnoremap <leader>p :cprev<cr>

" Toggle highlighting searches
nnoremap <leader>h :set hlsearch!<cr>

nnoremap <leader>rtw :call RemoveTrailingWhitespace()<cr>
nnoremap <leader>rtW :call RemoveTrailingWhitespaceConfirm()<cr>

" javascript help (NOTE: 'cl' conflicts with a mapping in nerdcommenter)
nnoremap <leader>cL oconsole.log("");<esc>hhi

" Format the current paragraph
nnoremap <leader>Qp mt{gq}'t

" Ctrl-C copies to system clipboard
vnoremap  "+y:let @*=@+<cr>:echo "Selection copied to system clipboard"<cr>

" Cursor attributes to better indicate the active editing mode
if &term =~ '^xterm-256color'

    " CURSOR SHAPE LEGEND
    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar

    " Insert mode
    let &t_SI .= "\<Esc>[3 q"
    "let &t_SI .= "\<Esc>12;red\x7"
    " Normal mode
    let &t_EI .= "\<Esc>[1 q"
    "let &t_EI .= "\<Esc>12;green\x7"

endif

" Respond to the mouse
set mouse=a

" Digraphs - shortcuts for non-ASCII characters
"   (Use ^k from insert mode, then type the first pair of characters to output
"   the unicode character with the decimal representation that follows.
dig :) 9786

" AHA-specific settings (Don't need this for home)
" source ~/.vim/aha.vim

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

