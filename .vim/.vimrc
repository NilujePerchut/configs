set nocompatible
set hidden

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

"Avoid swap files
set noswapfile

""""""""""""""""""""""""""
" Pathogen stuff
""""""""""""""""""""""""""
call pathogen#infect()

""""""""""""""""""""""""""
" Genral stuff
""""""""""""""""""""""""""
if has("gui_running")
	if has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
	set background=dark
	colorscheme solarized
	set cursorline
else
	colorscheme default
endif
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
nmap <silent> <A-k> gt
nmap <silent> <A-j> gT
"Use . instead of \ as leader key
let mapleader = ","
"Disable jedi by defaut
let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 1
"Just display the buffer if trying to open an already openned file
set switchbuf=useopen,usetab
""""""""""""""""""""""""""
" Language specific stuff
""""""""""""""""""""""""""
if has("autocmd")
	filetype plugin indent on
	au FileType vhdl call FT_vhdl()
	au FileType python call FT_python()
else
	set autoindent
endif

" VHDL stuff
function FT_vhdl()
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=2
	setlocal noexpandtab
	"Aliases
	iabbr dt downto
	iabbr sig Signal
	iabbr sl Std_Logic
	iabbr slv Std_Logic_Vector
endfunction

" Python stuff
function FT_python()
	"Enable jedi
	let g:jedi#auto_initialization = 1
	let python_highlight_all=1
	setlocal tabstop=4
	setlocal shiftwidth=4
	setlocal softtabstop=4
	setlocal expandtab
endfunction

""""""""""""""""""""""""""
" Status and command line
""""""""""""""""""""""""""
if has('cmdline_info')
        set ruler " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd " Show partial commands in status line and
" Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2
        " Broken down into easily includeable segments
        set statusline=%<%f\ " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y] " Filetype
        set statusline+=\ [%{getcwd()}] " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
    endif

    set backspace=indent,eol,start " Backspace for dummies
    set linespace=0 " No extra spaces between rows
    set showmatch " Show matching brackets/parenthesis
    set winminheight=0 " Windows can be 0 line high
    set ignorecase " Case insensitive search
    set smartcase " Case sensitive when uc present
    set wildmenu " Show list instead of just completing
    set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
    "set scrolljump=5 " Lines to scroll when cursor leaves screen
    "set scrolloff=3 " Minimum lines to keep above and below cursor
    "set foldenable " Auto fold code
    set list
    set listchars=tab:\ \ ,trail:_,extends:#,nbsp:. " Highlight problematic whitespace
    "set listchars=tab:›\ ,trail:_,extends:#,nbsp:. " Highlight problematic whitespace
	hi SpecialKey ctermfg=7 guifg=red
" }

""""""""""""""""""""""""""
" Tabulations command
""""""""""""""""""""""""""
:command KernelTabs set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
:command StdTabs set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""

" tagbar
nmap <F8> :TagbarToggle<CR>

" Ctags {
        set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
" }

" Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
"}

" ctrl-p {
		let g:ctrlp_working_path_mode = 'c'
		let g:ctrlp_switch_buffer = 'Et'
" }

" Ack.vim {
	let g:ackprg = 'ag --nogroup --nocolor --column'
" }

" vim-airline {
" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" To use the symbols , , , , , , and .in the statusline
" segments add the following to your .vimrc.before.local file:
" let g:airline_powerline_fonts=1
" If the previous symbols do not render for you then install a
" powerline enabled font.

" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
        if !exists('g:airline_theme')
            let g:airline_theme = 'powerlineish'
        endif
        if !exists('g:airline_powerline_fonts')
" Use the default set of separators with a few customizations
            let g:airline_left_sep='' " Slightly fancier than '>'
            let g:airline_right_sep='' " Slightly fancier than '<'
        endif
" }
" Do not report mixed indent with c style multiline comments
let g:airline#extensions#whitespace#mixed_indent_algo = 1

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

