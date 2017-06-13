call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
     set listchars=extends:>,precedes:<,tab:▶\ ,trail:•
else
     set listchars=extends:>,precedes:<,tab:>\ ,trail:~
endif

"Enable rainbow parents by default
let g:rainbow_active = 1

let g:lmap.t = { 'name': '+toggles' }
call SpaceNeovimNMap('tn', 'line-numbers', 'setlocal invnumber')
call SpaceNeovimNMap('tr', 'relative-line-numbers', 'setlocal invrelativenumber')
call SpaceNeovimNMap('tl', 'truncate-lines', 'setlocal invwrap')
call SpaceNeovimNMap('ts', 'syntax-checking', 'call SpaceNeovimToggleSyntax()')
call SpaceNeovimNMap('tS', 'spell-checking', 'setlocal invspell')
call SpaceNeovimNMap('tH', 'hidden-symbols', 'set list!')
call SpaceNeovimNMap('tg', 'git-gutter', 'GitGutterToggle')

let g:lmap.t.h = { 'name': '+highlight' }
call SpaceNeovimNMap('thh', 'highlight-current-line-globally', 'setlocal invcursorline')
call SpaceNeovimNMap('thc', 'highlight-indentation-current-column', 'setlocal invcursorcolumn')
call SpaceNeovimNMap('thp', 'rainbow-parenthesis', 'RainbowToggle')
call SpaceNeovimNMap('ths', 'highlight-search', 'set hlsearch!')

let g:lmap.t.f = { 'name': '+folding' }
call SpaceNeovimNMap('tfd', 'disable-folding', 'set nofoldenable')
call SpaceNeovimNMap('tfi', 'indent-folding', 'set foldenable \| set foldmethod=indent')
call SpaceNeovimNMap('tfm', 'marker-folding', 'set foldenable \| set foldmethod=marker')
call SpaceNeovimNMap('tff', 'toogle-full-section', 'normal! zA')
call SpaceNeovimNMap('tfa', 'fold-all', 'normal! zM')
call SpaceNeovimNMap('tfu', 'unfold-all', 'normal! zR')
