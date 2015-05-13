" View
" ----------------------------------------------------------------------

set number
set nowrap
set whichwrap=b,s,<,>,[,]

" wrap in preview windows.
autocmd MyAutoCmd BufWinEnter * if &previewwindow == 1
      \ |   setlocal wrap
      \ | endif

" hightlight cursorline
set cursorline

" space of bottom in window
set scrolloff=5

set laststatus=2
set cmdheight=2
set showcmd
set showmode
set showtabline=2

if neobundle#is_installed('syntastic')
  let g:syntastic_stl_format = '[E: %e, W: %w]'
endif

set shortmess=aT

set nobackup
set backupdir-=.

" disable bell.
set t_vb=
set novisualbell

set wildmenu
set wildmode=full

set history=100

" display all the information of the tag.
set showfulltag
set wildoptions=tagfile

set spelllang=en_US

" completion settings.
set completeopt=menuone,preview
set complete=.
set pumheight=20

" Report changes.
set report=0

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a window will put the new window below the current one.
set splitbelow
" Splitting a window will put the new window right the current one.
set splitright

" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Don't redraw while macro executing.
set lazyredraw

" When a line is long, do not omit it in @.
set display=lastline

" Disable automatically insert comment.
autocmd MyAutoCmd FileType *
      \ setl formatoptions-=ro | setl formatoptions+=mM

if v:version >= 703
  " For conceal.
  set conceallevel=2 concealcursor=iv

  set colorcolumn=100
endif

" Syntax
set autoindent smartindent

set background=dark
if !has('gui_running')
  let s:os_type = system('uname')
  set t_Co=256

  let g:hybrid_use_Xresources=1
endif

colorscheme hybrid
syntax enable

let macvim_skip_colorscheme=1
let macvim_skip_cmd_opt_movement=1

" Vim script
" augroup: a
" function: f
" lua: l
" perl: p
" ruby: r
" python: P
" tcl: t
" mzscheme: m
let g:vimsyn_folding = 'af'

