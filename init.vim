" Neovim startup configuration
"-----------------------------

" Shortcut to escape from terminal mode (NVIM only)
" This is a remap of the command that normally switches to the previously
" active window such that doing so escapes from terminal mode and THEN
" switches windows.
" Since it does the escape only from terminal mode, this means that the
" command is the same to switch windows, whether we're in terminal mode or
" not.  Kewl.
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

" NVIM-specific stuff done.  Now load regular vim config
source $HOME/.vim/vimrc
