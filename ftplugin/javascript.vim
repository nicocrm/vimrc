autocmd BufWritePre * :%s/\s\+$//e
set shiftwidth=2
set tabstop=2
UltiSnipsAddFiletypes javascript.braces
set sw=2 softtabstop=2

" Define some javascript file templates
" I guess we could be fancy and autoload them
com! -nargs=1 ReactNew :call OpenWithTemplate('<args>', '.js', 'react-newcomponent.js')
