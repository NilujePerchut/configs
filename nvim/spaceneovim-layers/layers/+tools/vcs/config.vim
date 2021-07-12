let g:lmap.g = { 'name': '+vcs/git' }
call SpaceNeovimNMap('gm', 'vimagit', 'Magit')
" Disable vimagit <leader>M mapping to keep leader menu clean
autocmd VimEnter * nunmap <leader>M
