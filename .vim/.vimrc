set nocompatible

"""""""""""""""""""""""""""
" Windows like stuffs
"""""""""""""""""""""""""""
" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection
vnoremap <BS> d
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

"Add a 80 chars Column line
set colorcolumn=80

"Explicitly specify Ruler
set ruler

""""""""""""""""""""""""""
" Pathogen stuff
""""""""""""""""""""""""""
call pathogen#infect()

""""""""""""""""""""""""""
" Genral stuff
""""""""""""""""""""""""""
set background=dark
colorscheme solarized
set cursorline
set hlsearch
set incsearch
set nu
syntax enable 
"Tabulation set to 4
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set ic
set autochdir
"Switch between Vim buffers using ALT+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"Switch between gVim tab using ALT+SHIFT+[jk]
nmap <silent> <A-K> gt
nmap <silent> <A-J> gT
"Use . instead of \ as leader key
let mapleader = ","

""""""""""""""""""""""""""
" Ctags search path
""""""""""""""""""""""""""
set tags=./tags;/

""""""""""""""""""""""""""
" Language specific stuff
""""""""""""""""""""""""""
if has("autocmd")
	filetype plugin indent on
	au FileType vhdl call FT_vhdl()
else
	set autoindent
endif

" VHDL stuff
function FT_vhdl()
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=2
	"Aliases
	iabbr dt downto 
	iabbr sig Signal
	iabbr sl Std_Logic
	iabbr slv Std_Logic_Vector
endfunction

""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""

" NERDTree 
	map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
	map <leader>e :NERDTreeFind<CR>
	nmap <leader>nt :NERDTreeFind<CR>
	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
	let NERDTreeChDirMode=0
	let NERDTreeQuitOnOpen=1
	let NERDTreeMouseMode=2
	let NERDTreeShowHidden=0
	let NERDTreeKeepTreeInNewTab=1
	let g:nerdtree_tabs_open_on_gui_startup=0

" undotree
	nnoremap <Leader>u :UndotreeToggle<CR>
	let g:undotree_SetFocusWhenToggle=1  

"neocomplcache
	let g:acp_enableAtStartup = 0
	let g:neocomplcache_enable_at_startup = 0
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_smart_case = 1
	let g:neocomplcache_enable_underbar_completion = 1
	let g:neocomplcache_enable_auto_delimiter = 1
	let g:neocomplcache_max_list = 15
	let g:neocomplcache_force_overwrite_completefunc = 1

	" SuperTab like snippets behavior.
	imap <silent><expr><TAB> neosnippet#expandable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
			\ "\<C-e>" : "\<TAB>")
	smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	    \ }

	" Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

    " Plugin key-mappings.
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    inoremap <expr><CR> neocomplcache#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()

	" Enable omni completion.
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

	" Enable heavy omni completion.
	if !exists('g:neocomplcache_omni_patterns')
		let g:neocomplcache_omni_patterns = {}
	endif
	let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    " use honza's snippets
    "let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

    " For snippet_complete marker.
    "if has('conceal')
	"	set conceallevel=2 concealcursor=i
    "endif

