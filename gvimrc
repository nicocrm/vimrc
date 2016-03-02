" Gvim specific settings
" (this needs to be linked or copied to ~/.gvimrc)
"
" Set a default size
set lines=35 columns=150
" Change path to the currently edited file, this fixes issue with nemo 
" opening in wrong working directory
cd %:p:h

