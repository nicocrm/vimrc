"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" V I M !
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Initialize plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin on
filetype indent on

runtime macros/matchit.vim

" }}}

" VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=50
set wildmenu "Turn on WiLd menu
set wildignore+=.git,*.exe,*.dll,*.so,node_modules,.meteor,*.map
set ignorecase "Ignore case when searching
set smartcase
set number " show line numbers

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink
set visualbell
set ruler
set showcmd
set laststatus=2  " show status bar always
set hidden    " allow hidden buffers
set foldlevel=5   " open folds by default, up to 5 levels

if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  " lines / columns for default size, this is set in .gvimrc instead
  " so that we can re-source vimrc with no ill effect
" set lines=35 columns=150
else
  let g:solarized_termcolors=256
endif

" Color scheme
" t_Co is needed for molokai in xterm
set t_Co=256
"colo molokai
colo solarized
call togglebg#map("<F5>")
set bg=dark

syntax on

" }}}

" Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
set autowrite
set autoread
set tags=./tags;

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

" }}}

" Text, tab and indent related {{{
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
" set completeopt-=preview
"
" }}}

" Mappings {{{
""""""""""""""""""""""""""""""

" Use space bar for leader
let mapleader = " "

" Use jk for escape
inoremap jk <esc>
" Not sure about this one, it's a bit annoying because you can't
" do a k at the end of a word
"inoremap kj <esc>
inoremap <esc> <nop>

" Allow C-S to save from insert mode
inoremap <c-s> <c-o>:w<cr>

" Quick movement in insert mode (not too sure about this one)
"inoremap OO <c-o>O

" inoremap {} {<cr>}<c-o>O
" inoremap ({} ({<cr>})<c-o>O

" Double slash for toggle comment
nmap // gcc

" Change current directory to that of the file
nnoremap <leader>cd :cd %:h<cr>
nnoremap <leader>lcd :lcd %:h<cr>

" CoPy: Quick copy of the current buffer to system clipboard
nnoremap <silent> <leader>cp :1,$yank +<cr>
" ReFormat: Quick reindent of current buffer
nnoremap <silent> <leader>rf gg=G``

" Mute Highlight: Use Alt+L to mute hl search (does not work in term)
" This also does a redraw (useful since I remapped C-l)
nnoremap <silent> <M-l> :nohlsearch<cr><C-l>

" Shortcut to edit the vimrc file and re-source it
nnoremap <leader>ev :tabedit ~/.vim/vimrc<cr>
nnoremap <leader>sv :w<cr>:source ~/.vim/vimrc<cr>:q<cr>

" Buffers

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>BB :bp <BAR> bd #<CR>
nmap <leader>B! :bp <BAR> bd! #<CR>

" Closing tabs
nmap <leader>TT :tabclose<cr>
nmap <leader>T! :tabclose!<cr>
nmap <leader>TO :tabonly<cr>

" Remap split commands so they work vertically
nnoremap  :vnew<cr>
nnoremap  :vsplit #<cr>

" Mappings used for window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Mappings for

" Shortcut for duplicating a line
nnoremap <C-d> :co .<cr>

" }}}

" Plugin Variables (and plugin-specific mappings) {{{
""""""""""""""""""""""""""""""
"""""""""""""""
" Command-T: use git for searches, but don't start from the SCM root
"  (I removed it and let it uses its default it generally works better and still is quite fast)
" let g:CommandTFileScanner='git'
" let g:CommandTTraverseSCM='pwd'
let g:CommandTMaxFiles=100000
let g:CommandTSCMDirectories='.git,.idea,.svn'
" allow Alt-T as alternate mapping
nnoremap <silent> <M-t> :CommandT<cr>
" nnoremap <silent> <leader>tt :CommandT<cr>
" nnoremap <silent> <leader>tb :CommandTBuffer<cr>
" Alt-R Buffer jump in MRU order, not sure I like that yet
nnoremap <silent> <M-r> :CommandTMRU<cr>

"""""""""""""""
" CtrlP (using this in favor of command-T, as it is a bit more featureful, and easier to install on Windows)
" OK I went BACK to Command-T because CtrlP has some annoying refresh issues
" Might keep CtrlP just for Windows benefit
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_root_markers = ['.idea']
" let g:ctrlp_max_files=100000
" " No need for custom ignore because we are putting those in wildignore already
" let g:ctrlp_custom_ignore='node_modules\|git\|.meteor'
" nnoremap <silent> <leader>pp :CtrlP<cr>
" nnoremap <silent> <leader>pr :CtrlPMRU<cr>
" nnoremap <silent> <leader>pb :CtrlPBuffer<cr>
" nnoremap <silent> <leader>pm :CtrlPMixed<cr>
" nnoremap <silent> <C-p> :CtrlPLastMode<cr>
"
"""""""""""""""
" NERDTree (no longer using, as NETRW is generally good enough and less annoying)
" nnoremap <leader>NT :NERDTree<cr>

" netrw
nnoremap <leader>ex :Explore
nnoremap <leader>sx :Sex
" to suppress banner, change to 0
let g:netrw_banner=1
" set current directory from netrw browse dir
let g:netrw_keepdir=0
" to open file in previous window (default is to use same window)
"let g:netrw_browse_split=4

autocmd FileType netrw setl bufhidden=delete


"""""""""""""""
" SPARKUP
" Replace default <C-n> mapping to avoid interfering with VIM completion
let g:sparkupNextMapping = '<c-f>'
let g:sparkupExecuteMapping = '<c-e>'

"""""""""""""""
" VIM AIRLINE
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Don't show buffer #, because we already show the index.
" Show file name, not full path
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"""""""""""""
" Buf Explorer - use upper case letters so they don't conflict
" with Command-T <leader>b mapping for buffer list
" (which is generally more useful than buf explorer)
nnoremap <leader>BE :BufExplorer<cr>
nnoremap <leader>BT :ToggleBufExplorer<cr>
nnoremap <leader>BS :BufExplorerHorizontalSplit<cr>
nnoremap <leader>BV :BufExplorerVerticalSplit<cr>

" Set a prefix for VIM WordMotion, so we can keep using the
" standard VIM keys
let g:wordmotion_prefix = ","

""""""""""""""
" Vim Notes - note taking in VIM
" (see also nicnote.vim which has some mappings)
let g:notes_directories = ['~/Dropbox/Documents/Notes']

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiZnipsJumpForwardTrigger="<c-j>"
let g:UltiZnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" prevent recursive mapping on standard c-x c-k (completion)
inoremap <c-x><c-k> <c-x><c-k>

" Sessions
let g:session_autosave = 'no'

" }}}


" vim: fdm=marker:ts=2:sw=2
