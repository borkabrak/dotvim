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
" * Source a file upon startup called registers.vim, macros.vim, or some such.
"   It loads various registers with generally useful macros.  Also, it
"   contains a command to re-source itself, resetting all the used registers
"   to their defaults, should they get changed in the course of normal use.
"
"
" * When switching buffers, put cursor in last postion on line, not just last
"   line
"
" * When you leave a window and come back, visual selections are not
"   preserved.  Could this be done, though, with BufEnter/Leave autocommands?
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

" Enable syntax highlighting
syntax enable

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

" Under certain lighting conditions, like the bus, I want a lighter background
function! Golight()
    colorscheme scheakur
endfunction
command! Golight call Golight()

" :W is an alias for :Sudosave
cnoreabbrev W Sudosave

" ========================================================================
" function RedirMessages() copied from:
"   http://stackoverflow.com/questions/2573021/how-to-redirect-ex-command-output-into-current-buffer-or-file
"   on: 2015-10-25
"   Author: Bill Odom
"   -----------------------------------------------------------------------
" " Inspired by the TabMessage function/command combo found
" at <http://www.jukie.net/~bart/conf/vimrc>.
"

 function! RedirMessages(msgcmd, destcmd)
 "
 " Captures the output generated by executing a:msgcmd, then places this
 " output in the current buffer.
 "
 " If the a:destcmd parameter is not empty, a:destcmd is executed
 " before the output is put into the buffer. This can be used to open a
 " new window, new tab, etc., before :put'ing the output into the
 " destination buffer.
 "
 " Examples:
 "
 "   " Insert the output of :registers into the current buffer.
 "   call RedirMessages('registers', '')
 "
 "   " Output :registers into the buffer of a new window.
 "   call RedirMessages('registers', 'new')
 "
 "   " Output :registers into a new vertically-split window.
 "   call RedirMessages('registers', 'vnew')
 "
 "   " Output :registers to a new tab.
 "   call RedirMessages('registers', 'tabnew')
 "
 " Commands for common cases are defined immediately after the
 " function; see below.
 "
     " Redirect messages to a variable.
     "
     redir => message

     " Execute the specified Ex command, capturing any messages
     " that it generates into the message variable.
     "
     silent execute a:msgcmd

     " Turn off redirection.
     "
     redir END

     " If a destination-generating command was specified, execute it to
     " open the destination. (This is usually something like :tabnew or
     " :new, but can be any Ex command.)
     "
     " If no command is provided, output will be placed in the current
     " buffer.
     "
     if strlen(a:destcmd) " destcmd is not an empty string
         silent execute a:destcmd
     endif

     " Place the messages in the destination buffer.
     "
     silent put=message

 endfunction

 " Create commands to make RedirMessages() easier to use interactively.
 " Here are some examples of their use:
 "
 "   :BufMessage registers
 "   :WinMessage ls
 "   :TabMessage echo "Key mappings for Control+A:" | map <C-A>

 " Show output in the current buffer
 command! -nargs=+ -complete=command BufMessage call RedirMessages(<q-args>, ''       )

 " Show output in a new window
 command! -nargs=+ -complete=command WinMessage call RedirMessages(<q-args>, 'new'    )

 " Show output in a new tab
 command! -nargs=+ -complete=command TabMessage call RedirMessages(<q-args>, 'tabnew' )

 " Convenience command that just passes arguments on to the function
 command! -nargs=+ -complete=command RedirMessages call RedirMessages(<f-args>)
" " ==============================================================================

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


" TODO: Get this to work properly.  Right now it's kind of a horrific jalopy
function! FoldFunctions()

    "We'll write to a register, so preserve its contents in the temp register
    let @"=@f

    "preserve the cursor position
    "execute "normal mx"

    " Set the foldmethod to allow this to work (since I don't use foldmethod
    " elsewhere)
    set foldmethod=manual

    "Load the macro that actually does the folding
    "let @f='/^\s*\(public\|private\)\?\s*function<cr>/{<cr>zf%j@f'
    let @f='/^[^\/]*function.*{/{zf%j@f'

    " Searches stop at EOF
    set nowrapscan

    " How to go to top of buffer and execute the macro?
    execute "normal gg@f"

    " Restore the original value of the register we overwrote
    let @f=@"

    " Restore original value of wrapscan (for now, just activate it)
    "set wrapscan

    " Restore cursor position
    "execute "`x"

endfunction

" For now, just load a macro in this register for use until I get the function
" working.
let @f='/^[^\/]*function.*{/{zf%j@f'

