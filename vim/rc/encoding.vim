" Encoding
" ----------------------------------------------------------------------

if has('kaoriya')
  set fileencodings=guess
endif

" set default formats
set fileformat=unix
set fileformats=unix,dos,mac
set ambiwidth=single

if has('multi_byte_ime')
  set iminsert-0 imsearch=0
endif

