
## How to use ##

To use, add the following lines to your vimrc (`/etc/vimrc`, `~/.vimrc`, `/usr/etc/vimrc` or `~/.vim/vimrc`):

	au BufNewFile,BufRead *Pkgfile set filetype=pkgfile
	au BufNewFile,BufRead *Pkgfile-* set filetype=pkgfile

The first line is for traditional ports, while the second one is for
multi-version ports.

