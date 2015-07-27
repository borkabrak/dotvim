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

"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" VUNDLE
"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"
" USEFUL VUNDLE COMMANDS
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" see :help vundle for more details or wiki for FAQ
filetype off
set rtp+=~/.vim/bundle/vundle.vim

call vundle#begin()
" Add plugins for vundle to manage
"
" After adding, try :PluginInstall <plugin>

  " Vundle itself
  Plugin 'gmarik/vundle.vim'

  " vim-misc is required for vim-notes
  Plugin 'xolox/vim-misc'
  " Run with :Note
  Plugin 'xolox/vim-notes'

  " Colorschemes!
  Plugin 'flazz/vim-colorschemes'
  Plugin 'altercation/vim-colors-solarized'
  "Light
  Plugin 'scheakur/vim-scheakur'
  "dark, greenish
  Plugin 'gryftir/gryffin'
  "Light, better than morning
  Plugin 'jlesquembre/peaksea'
  Plugin 'kreeger/benlight'
  Plugin 'trusktr/seti.vim'

  " Trying out a different status line..
  Plugin 'bling/vim-airline'

  " Sorta like vimium's helptags when browsing, but this is for moving around
  " in the file.  Key: <leader><leader>w
  Plugin 'Lokaltog/vim-easymotion'

  " Have tags without thinking about them
  "Bundle 'xolox/vim-easytags'

  " Git interface.. don't really use it yet
  Plugin 'tpope/vim-fugitive'

  " Surround is kind of awesome for quotes and whatnot
  Plugin 'tpope/vim-surround'

  " A writing aid to 'hyperfocus' on what you're doing (goyo uses limelight)
  Plugin 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 'gray'
  Plugin 'junegunn/goyo.vim'
  nnoremap <f4> :Goyo<cr>

  " Cool if I coded more scala..
  "Bundle 'derekwyatt/vim-scala'

  " Zen coding - the original (one I installed.  Default key: ^Y,)
  Plugin 'mattn/emmet-vim'

  " The tried-and-true file browser
  Plugin 'scrooloose/nerdtree'

  " Streamlined commenting
  Plugin 'scrooloose/nerdcommenter'

  " Live syntax checking
  Plugin 'scrooloose/syntastic'

  " A different approach to file navigation.  This is kind of a game changer
  " for managing buffers
  Plugin 'kien/ctrlp.vim'
  " Make CtrlP rebuild its list next time
  nnoremap <f3> :CtrlPClearCache<cr>
  " Use CtrlP only on currently open buffers
  nnoremap <leader><C-P> :CtrlPBuffer<cr>

  " Some stuff requires vimproc..
  Plugin 'Shougo/vimproc'

  " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  " Unite promises to be a replacement for CtrlP (and more).
  " Read more at http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
  " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Plugin 'shougo/unite.vim'

  " A better file browser?
  "Bundle 'shougo/vimfiler.vim'

  " Maybe *this* is a better file browser. (Really, a cleanup of netrw's
  " native interface.)  Key: -
  Plugin 'tpope/vim-vinegar'

  " Coffeescript support
  Plugin 'kchmck/vim-coffee-script'

  " Better ga, e.g.
  Plugin 'tpope/vim-characterize'

  " JSON manipulation and pretty-printing
  "   Get started with 'gqaj'
  Plugin 'tpope/vim-jdaddy'

  " Laravel's Blade syntax
  Plugin 'xsbeats/vim-blade'

  Plugin 'jceb/vim-orgmode'

  Plugin 'AndrewRadev/linediff.vim'

  " Better vim digraphs, initially inspired by Damien Conway's 'More Instantly
  " Better Vim' talk.
  Plugin 'panozzaj/betterdigraphs.vim'

" End plugin specifications
call vundle#end()
filetype plugin indent on

"""""""""""""""""""
" CONFIGURE PLUGINS
"""""""""""""""""""
if !exists('g:airline_symbols')
let g:airline_symbols = {}
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
"
" let g:airline_left_sep = '»'
" let g:airline_right_sep = '«'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
endif
"'❭', '❬']
"
" Unite calls have to go here.  Something about having to call vundle#end
" first?
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Well, Unite is sure as hell configurable..
" Act sorta like CtrlP

call unite#custom#profile('default', 'context', {
\   'winheight': 10,
\   'direction': 'botright',
\   'prompt': '❯ ',
\ })

" Other prompt options: »
call unite#custom#source('file_rec,file_rec/async',
    \ 'ignore_pattern', '.*\.exe$\|.*\.dll\|.*\.so')

" This tells Unite to ignore the same globs the rest of vim does
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs', split(&wildignore, ','))
" let g:unite_ignore_source_files = ['*.dll']

" Browse buffers
nnoremap <leader>b :Unite buffer<cr>
" Browse files
nnoremap <leader>f :Unite file<cr>
nnoremap <leader>F :Unite -start-insert file_rec/async:!<cr>

" Either this doesn't work, or I don't understand it..
" let g:unite_source_history_yank_enable = 1
" nnoremap <leader>y :<C-u>Unite history/yank<CR>


function! s:unite_my_settings()"{{{

    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)

    " Clear the cache
    nmap <buffer> <C-r>     <Plug>(unite_redraw)
    "}}}
endfunction
" Map commands for inside a unite window
autocmd FileType unite call s:unite_my_settings()

let g:mapleader = ","
" Use unicode
set encoding=utf-8

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

"Leader mappings

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
    " TODO: This doesn't actually check for a successful load
    nnoremap <Leader>s :source $MYVIMRC<cr>:echo "vimrc reloaded (we hope)."<cr>

    " Reload current file
    nnoremap <Leader>e :e<cr>

    " Toggle line numbers
    " Used by quickfix stuff.  This is easy enough to remember, so meh.
    " nnoremap <leader>n :set number!<cr>

    " Insert a signature
    nnoremap <Leader>@ oJon Carter<cr>borkabrak@gmail.com<Esc>

    " Insert a human-readable timestamp
    nnoremap <Leader>t :r!date +"\%F \%r"<cr>

    " Insert just the date
    nnoremap <Leader>D :r!date +"\%F"<cr>

    " run the current file
    nnoremap <Leader>r :!./%<cr>

    " save and run 'make'
    nnoremap <Leader>m :w<cr>:!make<cr>

    " make current file executable
    nnoremap <Leader>x :!chmod +x %<cr>

    " run current file specifically in perl (works with no shebang)
    nnoremap <Leader>P :!perl -wI . %<cr>

    " run current file specifically in ruby (works with no shebang)
    nnoremap <Leader>R :!ruby %<cr>

    " Underline the current line with various symbols.
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


" colorscheme delek " leaving this uncommented to sort of 'reset' the colorscheme when reloading this file
" colorscheme darkblue
" colorscheme torte
" colorscheme silent
" colorscheme intellij
" colorscheme tesla
" colorscheme bluegreen
" colorscheme dante
" colorscheme wombat256mod
" colorscheme telstar
" colorscheme adaryn
" colorscheme vc
" colorscheme manxome
"  colorscheme Monokai
" colorscheme codeschool
" colorscheme distinguished
" colorscheme vj
" colorscheme solarized
" colorscheme vividchalk
" colorscheme 256-jungle
colorscheme badwolf
" colorscheme benlight

runtime! macros/matchit.vim

" Read man pages within vim (<leader>K)
runtime! ftplugin/man.vim

" Hard mode (disable character-wise navigation to train yourself to use the more efficient motion commands)
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

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

" Set digraphs -- two-character mnemonics for characters that are otherwise
" difficult to type (i.e., you need to use Ctrl-Shift-U and know the hex
" code.) With a digraph, just hit ^K in insert mode, and type the
" two-character abbreviation
" dig CH 10003 " ✓ - check mark (This is actually on the digraph 'OK')


" GOYO AND LIMELIGHT
" I might not like this after a while, but I'm giving it a shot.  These two
" plugins more or less go together
" Think 'hyperfocus'  :)
function! GoyoBefore()
  Limelight
endfunction
function! GoyoAfter()
  Limelight!
endfunction

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

"================================================================
" Project-wide grep, with results managed in the quickfix window
" (Make sure you're in the top dir when you do this)
"================================================================

    " For performance reasons, let's have some filetype-specific funcs
    function! ProjectGrepPHP(pattern)
        echom "Grepping for "
        echom a:pattern
        echom ".."
        vimgrep a:pattern **/*.php | copen 5
    endfunction

" A couple of mapping to step through quickfix results easier:
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprev<cr>

" Toggle highlighting searches
nnoremap <leader>h :set hlsearch!<cr>

nnoremap <leader>rtw :call RemoveTrailingWhitespace()<cr>
nnoremap <leader>rtW :call RemoveTrailingWhitespaceConfirm()<cr>

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
nnoremap <leader>G :Goyo<cr>

" PLUGIN CONFIG FILES
" Netrw
" source ~/.vim/netrw.rc

" NERDTree
noremap <F2> :NERDTreeFind<cr>
" Open NERDTree, putting the cursor on the current file
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=1

" Respond to the mouse
set mouse=a

" Have commands run from :! use shell aliases
" Disabled because it messes up nvim's :terminal command
"set shell=/usr/bin/env\ zsh\ -l

" AHA-specific settings (Don't need this for home)
" source ~/.vim/aha.vim

" javascript help (NOTE: 'cl' conflicts with a mapping in nerdcommenter)
nnoremap <leader>cl oconsole.log("");<esc>hhi

" Change the cursor to better indicate mode
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

" Digraphs - shortcuts for non-ASCII characters
dig :) 9786
