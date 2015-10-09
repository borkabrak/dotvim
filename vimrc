" VIM CONFIGURATION
" ===================
"
" TODO:
" =======
"
"   BUGS:
"   ---------
" * Resourcing vimrc as implemented here (<leader>s) doesn't actually check
"   for a successful load
"
"   FEATURES:
"   -------------
" * Consider converting from Vundle to VimPlug
"
" * Check out tpope's plugins 'sensible' and 'sleuth'
"
" GENERAL TIPS:
" ======================================================================
"   :earlier and :later walk through changes to the buffer with respect
"   to time.
"
"   gd - goto the DECLARATION of the variable under the cursor
"
"   gv - reselects most recent visual selection
"
"   gi - return to most recent insert mode location

"   ga - show ASCII value of character under cursor (cf. g8) 
"        (behavior amended by tpope's 'characterize' plugin)
"
"   gD - go to definition of word under the cursor
" ======================================================================

" Do NOT try to emulate vi.
set nocompatible

" 'mapleader' can be used as a prefix to all sorts of user-defined keymappings
" by referring to it as <leader>, allowing us to change the prefix of all
" those mappings very easily just by changing it here.
let g:mapleader = ","

" Enable syntax highlighting
syntax enable

" ========================================================================
" CONFIGURATION OPTIONS
  source ~/.vim/options.vim
" ========================================================================

" ========================================================================
" KEY MAPPINGS
  source ~/.vim/mappings.vim
" ========================================================================

" ========================================================================
" FUNCTION DEFINITIONS
  source ~/.vim/functions.vim
" ========================================================================
"
" ========================================================================
" VUNDLE PLUGIN MANAGEMENT
  source ~/.vim/vundlerc.vim
" ========================================================================

" Include colorscheme setting separately, so it can be ignored by git and thus
" independent of setup instantiation.
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

" Do not create a bunch of backup files ending in tilde. (Is this a
" Windows-specific thing?)
" set nobackup
" set nowritebackup

" Highlight trailing whitespace as an error (:help match, matchadd,
" matchdelete for finer control here)
match ErrorMsg '\s\+$'

" ==============================================================================
" COMMANDS AND ABBREVIATIONS
" Similar to mappings, but more similar to shell aliases

" :Sudosave - for when you realize you SHOULD have opened that file with
"             escalated privileges.
command! Sudosave write !sudo tee % > /dev/null

" :W is an alias for :Sudosave
cnoreabbrev W Sudosave
" ==============================================================================

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

" Digraphs - shortcuts for non-ASCII characters
"   (Use ^k from insert mode, then type the first pair of characters to output
"   the unicode character with the decimal representation that follows.
dig :) 9786

" AHA-specific settings
"
" This is dependent on the environment (work/home), so we run just the first
" file by this name anywhere in 'runtimepath', without generating an error if
" the file doesn't exist.  (Increment 'verbose' to see a message in that case)
runtime aha.vim

