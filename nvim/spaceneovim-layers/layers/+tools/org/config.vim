" Start by resetting the major-mode and then add the new groups
au FileType org let g:lmap.m = { "name": "+major-mode-cmd" }
				  \| let g:lmap.m.c = { "name": '+checkbox' }
				  \| let g:lmap.m.t = { "name": '+todo' }

call SpaceNeovimFTNMap('org', 'mca', 'insert-above', 'OrgCheckBoxNewAbove')
call SpaceNeovimFTNMap('org', 'mcb', 'insert-below', 'OrgCheckBoxNewBelow')
call SpaceNeovimFTNMap('org', 'mcc', 'check-uncheck', 'OrgCheckBoxToggle')

" Use indentation for text under heading
let g:org_indent = 1
