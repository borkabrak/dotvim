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
" * :command :[E]dit
"     Open a file like :edit <file>.  If it doesn't exist, create it,
"     including the directory path down to it.
"
" * Remap gF (or map an alternative), to open the file relative not to
" whatever happens to be the current directory, but relative to the current
" file.
"   - Perhaps another form that tries relative to every file in $PATH.  Or to
"   vim's runtimepath.
"---------------------------------------------------------------------

" Do NOT try to emulate vi.
set nocompatible

" 'mapleader' can be used as a prefix to all sorts of user-defined keymappings
" by referring to it as <leader>, allowing us to change the prefix of all
" those mappings very easily just by changing it here.
"
" Define this near the beginning, to ensure that any mappings that follow can
" refer to it successfully.
let g:mapleader = ","

" CONFIGURATION OPTIONS
" ------------------------------------------------------------------------
  runtime! options.vim

" KEY MAPPINGS
" ------------------------------------------------------------------------
  runtime! mappings.vim

" FUNCTION DEFINITIONS
" ------------------------------------------------------------------------
  runtime! functions.vim

" VUNDLE PLUGIN MANAGEMENT
" ------------------------------------------------------------------------
  runtime! vundlerc.vim

" Load AHA-specific settings if they exist
" ------------------------------------------------------------------------
  runtime! aha.vim

" Match more than just braces (e.g. html tags.  Yup.)
" ------------------------------------------------------------------------
  runtime! macros/matchit.vim

" Read man pages within vim (<leader>K)
" ------------------------------------------------------------------------
  runtime! ftplugin/man.vim

" Include colorscheme setting separately, so it can be ignored by git and thus
" independent of setup instantiation.
" ------------------------------------------------------------------------
  runtime colorscheme.vim


" ========================================================================
" AUTOCOMMANDS:
" ========================================================================
" Save vim state info on shutdown
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

" Show relative line numbers (useful for counts to commands, for example),
" but keep absolute numbers when in insert mode.
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" ==============================================================================
" COMMANDS AND ABBREVIATIONS
" Similar to mappings, but more similar to shell aliases

" :Sudosave - for when you realize you SHOULD have opened that file with
"             escalated privileges.
command! Sudosave write !sudo tee % > /dev/null

" :W is an alias for :Sudosave
cnoreabbrev W Sudosave
" ==============================================================================

" Enable syntax highlighting
syntax enable

" Highlight trailing whitespace as an error (:help match, matchadd,
" matchdelete for finer control here)
match ErrorMsg '\s\+$'
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
