" Start by resetting the major-mode and then add the new groups
au FileType c let g:lmap.m = { "name": "+major-mode-cmd" }
				  \| let g:lmap.m.t = { "name": 'c/tabs' }

call SpaceNeovimSetFTIndentation('c', 4)

call SpaceNeovimFTNMap('c', 'mtk', 'kernel-tabs', 'set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab')
call SpaceNeovimFTNMap('c', 'mts', 'std-tabs', 'set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab')
