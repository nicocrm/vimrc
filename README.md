On Linux:

 * Clone to .vim
 * Move the vimrc_copy_to_home file to ~

On Windows: 

 * Clone to vimfiles
 * Move the vimrc_copy_to_home_windows file to ~

For both:
 * Run git submodule init
 * Run git submodule update

General stuff:
 * I remapped JK escape (I also unmapped escape temporarily to retrain my muscles).  It's very slightly annoying when typing because there is a short pause after typing a j but I hardly notice it and its nice not to have to stretch all the way over to escape.  Initially I had mapped both JK and KJ but that was annoying because you could not do a k at the end of the word without waiting for VIM to complete the mapping (and words ending with K are quite common)
 * Some useful keymappings to move between buffers
 * Remapped the leader key to the space bar

Bundle management:

 * Pathogen is installed in the bundles folder and loaded in the vimrc
 * Other packages can be added to the bundle folder (e.g. using git 
 submodule) then they will be loaded automatically by pathogen

Included packages (TODO - include description of packages and common shortcuts?)

 * vim-wordmotion is used to remap the usual word motions (w, e, and b) to follow camel case and underscores.  I set a , prefix so it only takes effect when doing stuff like ,w (I thought I was not using the word motions that much but they are very useful when replacing stuff in quotes)
 * command-t provides a fuzzy file matcher (not sure how well that will work on Windows).  I tried Ctrl-P too which was an easier install but it seemed less accurate.


