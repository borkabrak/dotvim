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
" * Detect ENV and load AHA-specific settings dynamically
"       - Although, there's nothing in it I really miss yet..
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

" Use Vim settings, rather than Vi settings (much better!).  This must be
" first, because it changes other options as a side effect.
" (Neovim doesn't require this, but I'm leaving it here so this vimrc setup
" still works under regular vim.)
set nocompatible

syntax enable

" ========================================================================
" OPTIONS
  source ~/.vim/options.vim
" ========================================================================

" ========================================================================
" MAPPINGS:
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
" COMMANDS AND ALIASES (abbreviations)
" Similar to mappings, but more similar to shell aliases

" :Sudosave will write the file using sudo, if user is a sudoer
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

" AHA-specific settings (Don't need this for home)
" source ~/.vim/aha.vim

