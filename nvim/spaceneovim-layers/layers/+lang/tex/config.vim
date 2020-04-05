" Start by resetting the major-mode and then add the new groups
au FileType tex let g:lmap.m = { "name": "+major-mode-cmd" }
			         \| let g:lmap.m.t = { "name": 'tex/tabs' }
				 \| set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

call SpaceNeovimSetFTIndentationNoExpand('tex', 4)
