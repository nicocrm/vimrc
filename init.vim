" Init file for neovim

" does not work very well with python 3
" let g:python_host_prog='/usr/bin/python2'
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkwait300-blinkon200-blinkoff150,r-cr:hor20-Cursor/lCursor-blinkwait300-blinkon200-blinkoff150
" Scrollback in terminal buffers
set scrollback=10000
" let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '~/.vim/venv-python3/bin/python3'
source $HOME/.vim/vimrc
