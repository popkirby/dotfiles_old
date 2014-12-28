" gvimrc
"
augroup MyGVimrc
  autocmd!
augroup END

" Fonts: {{{

set guifontwide=Ricty\ for\ Powerline:h14
set guifont=Ricty\ for\ Powerline:h14
set linespace=1

" }}}

" Window: {{{


if has('gui_macvim')
  " Transparency settings {{{
  let g:my_transparency = 5
  execute "set transparency=" . g:my_transparency
  augroup MyGVimrc
    autocmd BufLeave,BufWinLeave execute "set transparency=" . g:my_transparency
  augroup END
  " }}}
endif



if !exists('g:colors_name') || has('gui_macvim')
  set background=dark
  colorscheme hybrid
endif

" }}}

" Menu: {{{

set guioptions-=T
set guioptions-=m
set guioptions-=rL
set guioptions-=e

" }}}

" Mouse: {{{
set mousemodel=popup
set nomousefocus
set mousehide
" }}}

" Views: {{{
if exists('+guicursor')
  set guicursor=a:blinkwait4000-blinkon1500-blinkoff500
endif

set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

augroup MyGVimrc
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" Hack #74
nnoremap <silent> <Space>eg :<C-u>tabe $MYGVIMRC<CR>

" }}}

if exists('+antialias')
  set antialias
endif
