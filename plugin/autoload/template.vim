" Super simple template function
function! OpenWithTemplate(fname, extension, template)
    execute 'edit ' . fnameescape(a:fname . a:extension)
    execute 'keepalt silent read ~/.vim/templates/' . a:template
    1delete
    execute 'silent %s/FILENAME/' . a:fname . '/g'
endfunction
