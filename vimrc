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
"
" * Diff between current buffer and its file on disk
"
" * Figure out how to automate this the rest of the way:
"
"     How to fold all functions in a file:
"
"       /^\s*\(public\|private\)\?\s*function<cr>/{<cr>zf%j@f
"
"     - Yank that into the f register (might have to replace the <cr>s with
"     their literals,
"     - :set nowrapscan
"     - run "f as a macro (@f)"
"     - Put wrapscan back to where it was
"
"
" * Mapping to go to the beginning of the closest enclosing function - If this
"     line *is* the first line of a function definition, go to where it's called
"     (first within the file, ultimately within a directory - assume identical
"     file type?).  This way, we could build a stack trace all the way up to the
"     original invocation, which could be damn useful.
"
" * How many times does <x> appear in the current file?  On how many lines?
"
" TODO: Define a command that does project-wide search, limitable by filetype,
" and allow entering an arbitrary search string.  (cf. /Ggrep in this file)
"
" * Check out tpope's plugins 'sensible'
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


" TODO: Get this to work
function! FoldFunctions()

    "We'll write to a register, so preserve it's contents in the temp register
    let @"=@f

    "Also preserve the cursor position
    mx

    "Load the macro that actually does the folding
    "let @f='/^\s*\(public\|private\)\?\s*function<cr>/{<cr>zf%j@f'
    let @f='/^[^\/]*function.*{/{zf%j@f'

    " Searches stop at EOF
    set nowrapscan

    " How to go to top of buffer and execute the macro?
    " ???

    " Restore the original value of the register we overwrote
    let @f=@"

    " Restore original value of wrapscan (for now, just activate it)
    set wrapscan

    " Restore cursor position
    `x

endfunction

" For now, just load a macro in this register for use until I get the function
" working.
let @f='/^[^\/]*function.*{/{zf%j@f'

