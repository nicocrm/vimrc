" don't autoformat on write...
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
set shiftwidth=2
set tabstop=2
UltiSnipsAddFiletypes javascript.braces
" for odoo
set sw=4 softtabstop=4

" Define some javascript file templates
" I guess we could be fancy and autoload them
com! -nargs=1 ReactNew :call OpenWithTemplate('<args>', '.js', 'react-newcomponent.js')
let g:neoformat_enabled_javascript = ['prettier']
