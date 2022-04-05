" Start by resetting the major-mode and then add the new groups

" Default tabs: 2 spaces per char
au FileType vhdl let g:lmap.m = { "name": "+major-mode-cmd" }
				  \| let g:lmap.m.t = { "name": 'vhdl/tabs' }
				  \| set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

call SpaceNeovimSetFTIndentation('vhdl', 2)

call SpaceNeovimFTNMap('vhdl', 'mts', 'std_tabs', 'set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab')
call SpaceNeovimFTNMap('vhdl', 'mtk', 'kane-tabs', 'set tabstop=2 softtabstop=2 shiftwidth=2 expandtab')
