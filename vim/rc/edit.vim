" Edit
" ----------------------------------------------------------------------

" search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

" swap : <-> ;
nnoremap ; :
nnoremap : ;

" indents
set smarttab
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2

" round indent by shiftwidth
set shiftround

" enable modeline
set modeline

" use clipboard
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

" delete indent/newline with backspace
set backspace=indent,eol,start

" highlight pairs
set showmatch
set cpoptions-=m
set matchtime=3

" display another buffer when current buffer isnt saved
set hidden

" autoload when file is changed by other programs
set autoread

" ignore case on completion
set infercase

" enable folding
set foldenable
set foldmethod=marker

" show folding level
set foldcolumn=3
set fillchars=vert:\|
set commentstring=%s

if neobundle#is_installed('foldCC')
  " use foldCC.
  set foldtext=FoldCCtext()
  autocmd MyAutoCmd Filetype *
        \ if &filetype !=# 'help'
        \ | setlocal foldtext=FoldCCtext()
        \ | endif
endif

" set timeout
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time
set updatetime=1000

" enable virtualedit in visual block mode
set virtualedit=block

" Hack #202
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? 'y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

set directory&
let &directory=expand('$DOTFILES/tmp') . "," . &directory

if v:version >= 703
  set undofile
  let &undodir=&directory
endif

if has('nvim')
  set viminfo=\"50,'100,<1000,h,s100,n~/.nviminfo
else
  set viminfo=\"50,'100,<1000,h,s100,n~/.viminfo
endif

" Reload .vimrc and .gvimrc automatically.
if !has('gui_running')
  autocmd MyAutoCmd BufWritePost .vimrc nested source $MYVIMRC |
        \ echo "source $MYVIMRC"
else
  autocmd MyAutoCmd BufWritePost .vimrc nested source $MYVIMRC |
        \ if has('gui_running') | source $MYGVIMRC | echo "source $MYVIMRC"
  autocmd MyAutoCmd BufWritePost .gvimrc
        \ if has('gui_running') | source $MYGVIMRC | echo "source $MYGVIMRC"
endif


