""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
set ts=4 sw=4 sts=4
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" au FileType python inoremap <buffer> $r return
" au FileType python inoremap <buffer> $i import
" au FileType python inoremap <buffer> $p print
" au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
" au FileType python map <buffer> <leader>1 /class
" au FileType python map <buffer> <leader>2 /def
" au FileType python map <buffer> <leader>C ?class
" au FileType python map <buffer> <leader>D ?def

let b:ale_linters = ['jedils', 'flake8']
let b:ale_fixers = ['isort', 'black']
let b:ale_python_flake8_options = '--ignore=E501,E301,E302,W503'
" note that this will take precedence over options specified in the local pyproject.toml file
let b:ale_python_black_options = '--line-length 100'
