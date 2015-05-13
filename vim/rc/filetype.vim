" Filetype
" ----------------------------------------------------------------------

" TeX "{{{
autocmd FileType plaintex setlocal filetype=tex

if neobundle#is_installed("vim-quickrun")
  autocmd MyAutoCmd BufWritePost *.tex call quickrun#run() 
endif
" }}}

" Go {{{
autocmd FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=0 noexpandtab
" }}}

" Cpp {{{
autocmd FileType cpp setlocal path+=/usr/local/Cellar/boost/1.57.0/include

" }}}

