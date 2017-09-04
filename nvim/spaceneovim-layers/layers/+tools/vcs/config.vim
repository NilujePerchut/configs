let g:lmap.g = { 'name': '+vcs/git' }
call SpaceNeovimNMap('gs', 'git-status', 'Gstatus')
call SpaceNeovimNMap('gd', 'git-diff', 'Gdiff')
call SpaceNeovimNMap('gc', 'git-commit', 'Gcommit')
call SpaceNeovimNMap('gr', 'git-remove', 'Gremove')
call SpaceNeovimNMap('gm', 'vimagit', 'Magit')
" Disable vimagit <leader>M mapping to keep leader menu clean
autocmd VimEnter * nunmap <leader>M
