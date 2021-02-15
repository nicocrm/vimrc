"""""""""""""""""""""""""""""
" => PHP section
"""""""""""""""""""""""""""""

setlocal tabstop=4 shiftwidth=4
au FileType php nnoremap <F5> :!php %<cr>
" au FileType php nnoremap <C-F5> :2,$ SlimeSend<cr>

setlocal suffixesadd=.php
UltiSnipsAddFiletypes php.braces
