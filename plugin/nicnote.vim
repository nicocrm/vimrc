nnoremap <silent> <leader>nnv :call NicNoteView()<cr>
nnoremap <silent> <leader>nns :call NicNoteNewScratch()<cr>
nnoremap <silent> <leader>nnp :call NicNoteNewProgress()<cr>

function! NicNoteView()
    let fn = g:notes_directories[0]
    execute "Ex " . fn
endfunction

function! NicNoteNewScratch()
    let fn = strftime("%Y-%m-%d_%H-%M") 
    execute "Note" "Scratch/" . fn
endfunction

function! NicNoteNewProgress()
    let fn = strftime("%Y-%m-%d") 
    execute "Note" "Progress/" . fn
endfunction

