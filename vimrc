" VIM CONFIGURATION
" ===================
"
" TODO:
" =======
"
"   FEATURES:
"   -------------
" * Mapping to open the filename under the cursor, searching:
"       - vim's pwd
"       - the directory of the current buffer's file
"       - vim's runtimepath
"       - $PATH
"       - the git root (if there is one)
"---------------------------------------------------------------------
"
" * When switching buffers, restore cursor postion, not just the line number.
"
" * When you leave a window and come back, visual selections are not
"   preserved.  Could this be done, though, with BufEnter/Leave autocommands?
"
" * Diff between current buffer and its file on disk
"
" * Function to fold all functions in a file
"
" * Mapping to go to the beginning of the closest enclosing function - If this
"     line *is* the first line of a function definition, go to where it's called
"     (first within the file, ultimately within a directory - assume identical
"     file type?).  This way, we could build a stack trace all the way up to the
"     original invocation, which could be damn useful.
"
" * How many times does <x> appear in the current file?  On how many lines?
"
" * Check out tpope's plugins 'sensible'
"
" * :command :[E]dit
"     Open a file like :edit <file>.  If it doesn't exist, create it,
"     including the directory path down to it.
"

" CONFIGURATION OPTIONS
"   - Options can have an effect on how everything else works, and should be
"     set before everything else, as near as possible.  For example, 't_Co=256'
"     must occur before 'colorscheme badwolf', otherwise the latter has no
"     effect
runtime! options.vim

" runtime! resetConfig.vim " Not yet implemented

runtime! mappings.vim

" VUNDLE PLUGIN MANAGEMENT
" ------------------------------------------------------------------------
runtime! vundlerc.vim

" SET COLORSCHEME
"     Include colorscheme setting separately, so it can be ignored by git and thus
"     independent of setup instantiation.
runtime! colorscheme.vim

" FUNCTION DEFINITIONS
" ------------------------------------------------------------------------
runtime! functions.vim

" Load AHA-specific settings if they exist
" ------------------------------------------------------------------------
runtime! aha.vim

" Match more than just braces (e.g. html tags.  Yup.)
" ------------------------------------------------------------------------
runtime! macros/matchit.vim

" Read man pages within vim (<leader>K)
" ------------------------------------------------------------------------
runtime! ftplugin/man.vim

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
 "   [ Not convinced this works.. -jdc ]
 command! -nargs=+ -complete=command RedirMessages call RedirMessages(<f-args>)
" " ==============================================================================

" Highlight trailing whitespace as an error (:help match, matchadd,
" matchdelete for finer control here)
" match ErrorMsg '\s\+$'
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

" Digraphs - shortcuts for non-ASCII characters
"   (Use ^k from insert mode, then type the first pair of characters to output
"   the unicode character with the decimal representation that follows.
"   (Putting this last because the syntax highlighting doesn't react well to
"   the parentheses, and miscolors everything that follows.)

"[ ☺ ] Unicode happy face
digraph :) 9786

"[ ☹ ] Unicode sad face
digraph :( 9785

"[ … ] horizontal ellipsis
digraph el 8230

"[ ∙ ] list bullet (A big dot, halfway up the line)
digraph	>. 8729

"[ ≅ ] approximately equal to
digraph ~= 8773
