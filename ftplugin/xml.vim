
"""""""""""""""""""""""""""""
" => XML
"""""""""""""""""""""""""""""
" Set up xmllint to run for = indentation
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
