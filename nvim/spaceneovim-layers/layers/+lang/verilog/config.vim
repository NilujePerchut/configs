" Start by resetting the major-mode and then add the new groups
au BufNewFile,BufRead *.vh set filetype=verilog
au BufNewFile,BufRead *.sv set filetype=verilog
au FileType verilog let g:lmap.m = { "name": "+major-mode-cmd" }
				  \| set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

call SpaceNeovimSetFTIndentationNoExpand('verilog', 2)
