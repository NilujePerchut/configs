" Set layer specific configurations {{{
" Use powerline fonts for airline
let g:airline_theme = 'powerlineish'
" Do not report mixed indent with c style multiline comments
let g:airline#extensions#whitespace#mixed_indent_algo = 2

if !exists('g:sp_airline_disable_powerline_fonts') || g:sp_airline_disable_powerline_fonts == 0
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline_symbols.space = "\ua0"
else
  let g:airline_left_sep=''
  let g:airline_right_sep=''
endif
" }}}
