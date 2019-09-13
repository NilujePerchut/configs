" Start by resetting the major-mode and then add the new groups
au FileType make let g:lmap.m = { "name": "+major-mode-cmd" }
				  \| let g:lmap.m.t = { "name": 'make/tabs' }
				  \| set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

call SpaceNeovimSetFTIndentationNoExpand('make', 4)
