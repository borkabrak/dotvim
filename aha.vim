"""""""""""""""""""""""""""""""""""""""
"
"   AHA-specific settings
"
"""""""""""""""""""""""""""""""""""""""

" Laravel commands begin with <leader>L
"
" 'Die out' a variable (insert a command to kill execution with a var dump)
nnoremap <leader>Ld o{{ dd() }}<Esc>F(a
" Alias to obviate capitalization concern
nmap <leader>LD <leader>Ld

" Print a log message from within Laravel
" nnoremap <leader>Ll o\Log::info("");<Esc>F(la
nnoremap <leader>Ll lF$veyo\Log::info(print_r( array(<cr>'message' => '%',<cr>'"' => ",<cr>), true));<Esc>?message<cr>2Wvi'

nmap <leader>LL <leader>Ll


" Print a log message from within HTML
nnoremap <leader>Lh o<pre>{{ }}</pre><Esc>?{<cr>a
nmap <leader>LH <leader>Lh

vnoremap <leader>Ld o{{ dd() }}<Esc>F(a

" open a partial's file
"
"   Example: open the file represented by the following
"
"       @include('theme.default.partials.popups._downloadReportPopup')
"
"       It needs to:
"           * replace dots with slashes
"           * assume a correct initial dir
"           * append .blade.php
"           * leave the text unchanged
"
"       theme/default/partials/popups/_downloadReportPopup
function! OpenPartial()
    echo "OpenPartial: Not yet implemented"
endfunction

noremap <leader>Lgf :call OpenPartial()<cr>

" Set vim's current directory to the local BIQ repository root
nnoremap <leader>cdb :cd /cygdrive/c/Users/jcarter/biq<cr>
nmap <leader>B <leader>cdb 
