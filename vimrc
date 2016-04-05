"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" V I M !
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Initialize plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

if has('windows')
  let $VIMHOME = $HOME."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

call plug#begin('$VIMHOME/plugged')

Plug 'tpope/vim-sensible'
Plug 'rking/ag.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'wesQ3/vim-windowswap'
if has('python')
  Plug 'SirVer/ultisnips'
endif
Plug 'jlanzarotta/bufexplorer'
" emmett type plugin
Plug 'rstacruz/sparkup'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Plug 'wavded/vim-stylus'
" Very useful, includes text objects like "ii" for stuff at the current indent level
Plug 'michaeljsmith/vim-indent-object'
" Notes
Plug 'xolox/vim-misc'
Plug 'nicocrm/vim-notes'
Plug 'xolox/vim-session'
" Those are both similar, command-t generally works faster but is more of a pain to install
" and doesn't work on neovim
Plug 'wincent/command-t'
Plug 'ctrlpvim/ctrlp.vim'
" light weight file explorer
Plug 'jeetsukumaran/vim-filebeagle'
" AUtomatically insert matching parentheses, but it's usually more of a PIA than anythign else
" Plug 'Raimondi/delimitMate'
" PHP
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'shawncplus/phpcomplete.vim'
" Coffee Script, not really doing any of that anymore
" Plug 'kchmck/vim-coffee-script'
" Plug 'mtscout6/vim-cjsx'

call plug#end()

" runtime bundle/vim-pathogen/autoload/pathogen.vim
" execute pathogen#infect()
" filetype plugin on
" filetype indent on
"
" runtime macros/matchit.vim

" }}}

" VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=50
set wildmenu "Turn on WiLd menu
set wildignore+=.git,*.exe,*.dll,*.so,node_modules,.meteor,*.map
set ignorecase "Ignore case when searching
set smartcase
set number " show line numbers
set autochdir " Automatically change to current file directory

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
  if has("x11")
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
  endif
  let g:solarized_termcolors=256
endif

" Color scheme
" t_Co is needed for molokai in xterm
set t_Co=256
" Note when using molokai, bg should be before the color declaration
set bg=dark
" colo molokai
colo distinguished
" colo solarized
" call togglebg#map("<F5>")

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

" Use jj for escape (try this instead of jk?)
inoremap jj <esc>
"inoremap jk <esc>
inoremap <esc> <nop>
" JJ for newlines?
inoremap JJ <cr>

" Use ctrl-J for return
" (this mapping is temporary)
" (remove this no longer necessary with new keyboard)
"inoremap <cr> <nop>

" Allow C-S to save from insert mode
inoremap <c-s> <c-o>:w<cr>

" Quick movement in insert mode (not too sure about this one)
inoremap OO <c-o>O

" inoremap {} {<cr>}<c-o>O
" inoremap ({} ({<cr>})<c-o>O

" Alt-slash for toggle comment
" (I put alt instead of control because the C-/ mapping does not seem to work right)
"nmap // gcc  " this one is annoying, it messes up my search prompt
nmap <M-/> gcc
nmap <C-/> gcc

" Change current directory to that of the file
nnoremap <leader>cd :cd %:h<cr>
nnoremap <leader>lcd :lcd %:h<cr>
" This is like gf but will also edit a file that does not exist yet
nnoremap <leader>gf :e <cfile><cr>

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

" Completion mappings (suggested in help ins-completion)
" Tag completion
inoremap <c-]> <c-x><c-]>
" File name completion
inoremap <c-f> <c-x><c-f>
" Macro definition
" TODO: need to come up with correct include and definition options for javascript
inoremap <c-d> <c-x><c-d>
" Line completion
inoremap <c-l> <c-x><c-l>
" Should maybe bind C-X C-O (omni completion)?

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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_show_hidden = 1
" Custom root markers
let g:ctrlp_root_markers = ['.idea']
let g:ctrlp_max_files=100000
" Use caching if > 1000 files
let g:ctrlp_use_caching=1000
" No need for custom ignore because we are putting those in wildignore already, but just in case
let g:ctrlp_custom_ignore='node_modules\|git\|.meteor'
nnoremap <silent> <leader>pp :CtrlP<cr>
nnoremap <silent> <leader>pr :CtrlPMRU<cr>
nnoremap <silent> <leader>pb :CtrlPBuffer<cr>
nnoremap <silent> <leader>pm :CtrlPMixed<cr>
nnoremap <silent> <C-p> :CtrlPLastMode<cr>
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
let g:sparkupNextMapping = '<c-d>'
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
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" prevent recursive mapping on standard c-x c-k (completion)
inoremap <c-x><c-k> <c-x><c-k>

" Sessions
let g:session_autosave = 'no'

" }}}


" vim: fdm=marker:ts=2:sw=2
