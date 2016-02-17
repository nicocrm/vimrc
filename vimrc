set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin on
filetype indent on

runtime macros/matchit.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=50
set wildmenu "Turn on WiLd menu
set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink
set visualbell 
set ruler
set showcmd
set laststatus=2  " show status bar always

if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  set lines=48 columns=125
endif

" Color scheme
" t_Co is needed for molokai in xterm
set t_Co=256
set bg=dark
colo molokai

syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
set autowrite

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set bs=2
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
" do not show preview window on complete
set completeopt-=preview

""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""

" Use , for leader
let mapleader = ","

" Use jk for escape
inoremap jk <esc>
inoremap <esc> <nop>

" Double slash for toggle comment
nmap // gcc

" Shortcut to edit the vimrc file and re-source it
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>:q<cr>

" Buffers

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Remap split commands so they work vertically
nnoremap  :vnew<cr>
nnoremap  :vsplit #<cr>

" Mappings used for window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


""""""""""""""""""""""""""""""
" => Plugin Variables
""""""""""""""""""""""""""""""
" Command-T: use git for searches, but don't start from the SCM root
let g:CommandTFileScanner='git'
let g:CommandTTraverseSCM='pwd'

" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
" Disable bufferline integration with VIM airline, since we already have it
" in the command window
let g:airline#extensions#bufferline#enabled = 0
" Echo bufferline in the command line
let g:bufferline_echo = 1

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" (folding disabled right now)
"au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen
"au FileType javascript setl nocindent

"au FileType javascript imap <c-t> console.log();<esc>hi
"au FileType javascript imap <c-a> alert();<esc>hi

"au FileType javascript inoremap <buffer> $r return
"au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi


"""""""""""""""""""""""""""""
" => PHP section
"""""""""""""""""""""""""""""

