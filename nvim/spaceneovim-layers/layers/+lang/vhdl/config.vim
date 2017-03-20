" Start by resetting the major-mode and then add the new groups
au FileType vhdl let g:lmap.m = { "name": "+major-mode-cmd" }
				  \| set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

call SpaceNeovimSetFTIndentationNoExpand('vhdl', 2)
