"-------------------------------------------------------------------------------
" popkirby's vimrc
"-------------------------------------------------------------------------------

" Initialize "{{{

" <Leader> mappings.
let g:mapleader =','
let g:maplocalleader = 'm'

" change , -> \
nnoremap \ ,

nnoremap m <Nop>
xnoremap m <Nop>
nnoremap , <Nop>
xnoremap , <Nop>

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

" Secret vimrc...
if filereadable(expand('~/.secret_vimrc'))
  execute 'source' expand('~/.secret_vimrc')
endif


let s:plugin_develop = 0
if filewritable(expand('~/vim-develop'))
  let s:plugin_develop = 1
endif

" }}}

" Bundles "{{{
let s:neobundle_dir = expand('~/.vim/bundle')
" Load neobundle.
if isdirectory('neobundle.vim')
  set runtimepath^=neobundle.vim
elseif finddir('neobundle.vim', '.;') != ''
  execute 'set runtimepath^=' . finddir('neobundle.vim', '.;')
elseif &runtimepath !~ '/neobundle.vim'
  if !isdirectory(s:neobundle_dir . '/neobundle.vim')
    execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git', 
          \ 'https')
          \ s:neobundle_dir . '/neobundle.vim'
  endif

  execute 'set runtimepath^=' . s:neobundle_dir . '/neobundle.vim'
endif

let g:neobundle#types#git#default_protocol = 'https'

call neobundle#begin(s:neobundle_dir)

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'mac' : 'make -f make_mac.mak', 
      \   'unix' : 'make -f make_unix.mak',
      \ }}

NeoBundleLazy 'Shougo/neocomplete.vim'

NeoBundleLazy 'Shougo/neosnippet'

NeoBundleLazy 'Shougo/neosnippet-snippets', {
      \ 'depends' : 'Shougo/neosnippet'
      \ }

NeoBundleLazy 'Shougo/unite.vim', {
      \ 'depends' : 'Shougo/tabpagebuffer.vim'
      \ }

NeoBundleLazy 'Shougo/vimfiler', {
      \ 'depends' : 'Shougo/unite.vim',  
      \ }

NeoBundleLazy 'Shougo/junkfile.vim'

NeoBundleLazy 'jiangmiao/simple-javascript-indenter'

NeoBundleLazy 'jelera/vim-javascript-syntax'

NeoBundleLazy 'Shougo/unite-outline', {
      \ 'autoload' : {
      \   'unite_sources' : 'outline'
      \ }}

NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ 'autoload' : {
      \   'filetypes' : ['css', 'scss'],
      \ }}

NeoBundle 'scrooloose/syntastic'

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'LeafCage/foldCC'

NeoBundleLazy 'thinca/vim-quickrun'

NeoBundleLazy 'kana/vim-smartchr'

NeoBundle 'altercation/vim-colors-solarized'

NeoBundleLazy 'mattn/emmet-vim', {
      \ 'autoload' : {
      \   'filetypes' : ['html'], 
      \ }}

NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ 'autoload' : {
      \   'filetypes' : ['scss', 'sass']
      \ }}

NeoBundleLazy 'itchyny/thumbnail.vim', {
      \ 'autoload' : {
      \   'commands' : 'Thumbnail'
      \ }}


NeoBundleLazy 'othree/html5.vim', {
      \ 'autoload' : {
      \   'filetypes' : ['html', 'php']
      \ }}

NeoBundle 'vim-jp/vimdoc-ja'

NeoBundleLazy 'rhysd/accelerated-jk'

NeoBundleLazy 'thinca/vim-ref'

NeoBundleLazy 'ujihisa/neco-look', {
      \ 'depends' : ['Shougo/neocomplete.vim'], 
      \ 'on_source' : ['neocomplete.vim'], 
      \ }

NeoBundleLazy 'marijnh/tern_for_vim', {
      \ 'build' : {
      \   'mac' : 'npm install', 
      \ }}

NeoBundle 'itchyny/lightline.vim'

NeoBundleLazy 'kchmck/vim-coffee-script'

NeoBundleLazy 'ujihisa/unite-colorscheme', {
      \ 'autoload' : {
      \   'unite_sources' : 'colorscheme', 
      \ }}

NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'cocopon/lightline-hybrid.vim'

NeoBundle 'vim-scripts/twilight'

NeoBundle 'jonathanfilip/vim-lucius'

NeoBundle 'nanotech/jellybeans.vim'

NeoBundle 'cocopon/iceberg.vim'

NeoBundle 'osyo-manga/vim-anzu'

NeoBundleLazy 'cocopon/colorswatch.vim', {
      \ 'autoload' : {
      \   'commands' : 'ColorSwatchGenerate'
      \ }}

NeoBundle 'popkirby/vim-syntax-kag3'

NeoBundle 'popkirby/lightline-iceberg', {
      \ 'depends' : 'lightline.vim'
      \ }

NeoBundleLazy 'rhysd/wandbox-vim', {
      \ 'autoload' : {
      \   'commands' : 'Wandbox'
      \ }}

NeoBundleLazy 'leafgarland/typescript-vim', {
      \ 'autoload' : {
      \   'filetypes' : ['typescript']
      \ }}

NeoBundleFetch 'ervandew/eclim', {
      \ 'build': {
      \   'mac' : 'ant -Declipse.home=' . escape(expand('/Applications/eclipse'), '')
      \            . ' -Dvim.files=' . escape(expand('$HOME/.vim'), '')
      \ }}

NeoBundle 'chriskempson/base16-vim'

NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle 'ekalinin/Dockerfile.vim'

NeoBundle 'fatih/vim-go'

if s:plugin_develop == 1
  execute 'source' expand('~/vim-develop/dev-bundles.vim')
endif

filetype plugin indent on

call neobundle#end()

" Check Bundles.
NeoBundleCheck

" }}}

" Encoding "{{{
" for kaoriya
if has('kaoriya')
  set fileencodings=guess
endif

" Default fileformat.
set fileformat=unix

" settings for new line.
set fileformats=unix,dos,mac

" prevent ****wtf**** statusline with powerline-font
set ambiwidth=single


if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

" }}}

" Search "{{{
" Ignore the case of normal letters - but override when contains upper case.
set ignorecase
set smartcase

" Enable incremental search.
set incsearch

" Disable highlight by <ESC><ESC>.
set hlsearch

" Search wrap around.
set wrapscan

" }}}

" Edit "{{{
" smart tab for indenting.
set smarttab

" expand tab to space.
set expandtab

" tab spaces.
set tabstop=2 softtabstop=2 shiftwidth=2

" round indent by shiftwidth.
set shiftround

" enable modeline.
set modeline

" Use clipboard register.
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

" delete indent/newline by backspace.
set backspace=indent,eol,start

" Highlight pairs.
set showmatch
set cpoptions-=m
set matchtime=3

" Display another buffer when current buffer isnt saved.
set hidden

" Autoload when file is changed by other programs.
set autoread

" ignore case on completion.
set infercase

" Enable folding.
set foldenable
set foldmethod=marker

" show folding level.
set foldcolumn=3
set fillchars=vert:\|
set commentstring=%s

if neobundle#is_installed('foldCC')
  " Use FoldCCtext().
  set foldtext=FoldCCtext()
  autocmd MyAutoCmd FileType *
        \               if &filetype !=# 'help'
        \             |   setlocal foldtext=FoldCCtext()
        \             | endif
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

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=1000

" Enable virtualedit in visual block mode.
set virtualedit=block

" Hack #202
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force || 
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" Hack #74
nnoremap <silent> <Space>ev :<C-u>e $MYVIMRC<CR>

set directory&
let &directory=expand('$DOTFILES/tmp') . "," . &directory

if v:version >= 703
  set undofile
  let &undodir=&directory
endif


" Hack #69
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" viminfo setting.
set viminfo=\"50,'100,<1000,h,s100,n~/.viminfo

" }}}

" View "{{{

" Show line number.
set number

" not to wrap line.
set nowrap
set whichwrap=b,s,<,>,[,]

" wrap in preview windows.
autocmd MyAutoCmd BufWinEnter * if &previewwindow == 1
      \ |   setlocal wrap
      \ | endif

" hightlight cursorline.
set cursorline

" space of bottom in window.
set scrolloff=5

" Always display statusline.
set laststatus=2
" Height of command line.
set cmdheight=2
" Show command on statusline.
set showcmd
" Show modes.
set showmode

" always show tabline.
set showtabline=2

" statusline.
if neobundle#is_installed('syntastic')
  let g:syntastic_stl_format = '[E: %e, W: %w]'
endif

set shortmess=aT

set nobackup
set backupdir-=.

" Disable bell.
set t_vb=
set novisualbell

" candidate supply.
set wildmenu
set wildmode=full

" Increase history ammount.
set history=100

" display all the information of the tag.
set showfulltag
set wildoptions=tagfile

" Enable spellchecking.
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

  set colorcolumn=85
endif

" Tag Jumps
nnoremap t <Nop>
nnoremap tt <C-]>
nnoremap tj :<C-u>tag<CR>
nnoremap tk :<C-u>pop<CR>

" }}}

" Syntax "{{{
"
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


" }}}

" Filetype Settings "{{{

" TeX "{{{
autocmd FileType plaintex setlocal filetype=tex

if neobundle#is_installed("vim-quickrun")
  autocmd MyAutoCmd BufWritePost *.tex call quickrun#run() 
endif
" }}}

" Go {{{
autocmd FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=0 noexpandtab
" }}}

" }}}

" Plugins "{{{

" neocomplete.vim "{{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

if neobundle#tap('neocomplete.vim')
  call neobundle#config({
        \ 'autoload' : {
        \   'insert' : 1, 
        \   'commands' : 'NeoCompleteBufferMakeCache', 
        \ }})
  
  function! neobundle#tapped.hooks.on_source(bundle)
    " Use smartcase.

    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
          \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
          \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

    if neobundle#is_installed('tern_for_vim')
      autocmd FileType javascript setlocal omnifunc=tern#Complete
    else
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#Complete
    endif

    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:neocomplete#force_omni_input_patterns.java = '\%(\h\w*\|)\)\.\w*'

    " :NeoCompleteToggle mapping
    inoremap <C-T> <C-O>:NeoCompleteToggle<CR>
  endfunction
  call neobundle#untap()
endif

" }}}

" neosnippet {{{
if neobundle#tap('neosnippet')
  call neobundle#config({
        \ 'autoload' : {
        \   'insert' : 1, 
        \   'filetypes' : 'snippet', 
        \   'unite-sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
        \ }})


  function! neobundle#tapped.hooks.on_source(bundle)
    imap <C-k>  <Plug>(neosnippet_expand_or_jump)
    smap <C-k>  <Plug>(neosnippet_expand_or_jump)
    xmap <C-l>  <Plug>(neosnippet_start_unite_snippet_target)
  endfunction
  call neobundle#untap()
endif

if neobundle#tap('neosnippet-snippets')
  call neobundle#config({
        \ 'autoload' : {
        \   'insert' : 1,
        \   'filetypes' : 'snippet',
        \   'unite-sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
        \ }})
  call neobundle#untap()
endif

" }}}

" unite.vim {{{
if neobundle#tap('unite.vim')
  call neobundle#config({
        \ 'autoload' : {
        \   'commands' : [
        \     { 'name' : 'Unite', 
        \       'complete' : 'customlist,unite#complete_source' }, 
        \       'UniteWithCursorWord', 'UniteWithInput'], 
        \ }})

  nnoremap [unite] <Nop>
  nmap _ [unite]

  nnoremap [unite]r :<C-u>Unite
        \ -buffer-name=register register<CR>
  nnoremap [unite]o :<C-u>Unite 
        \ -buffer-name=outline outline
  nnoremap [unite]b :<C-u>Unite
        \ -buffer-name=buffer_tab buffer_tab<CR>

  nnoremap [unite]h :<C-u>Unite -start-insert help<CR>

  let g:unite_force_overwrite_statusline = 0
  call neobundle#untap()
endif

" }}}

" vimfiler "{{{
if neobundle#tap('vimfiler')
  call neobundle#config({
      \ 'autoload' : {
      \   'commands' : [
      \     { 'name' : 'VimFiler', 
      \       'complete' : 'customlist,vimfiler#complete' }, 
      \     { 'name' : 'VimFilerExplorer', 
      \       'complete' : 'customlist,vimfiler#complete' }, 
      \     { 'name' : 'Edit', 
      \       'complete' : 'customlist,vimfiler#complete' }, 
      \     { 'name' : 'Write', 
      \       'complete' : 'customlist,vimfiler#complete' }, 
      \     'Read', 'Source'], 
      \   'mappings' : '<Plug>(vimfiler_', 
      \   'explorer' : 1, 
      \ }})
  call neobundle#untap()
endif
"}}}

" junkfile.vim "{{{
if neobundle#tap('junkfile.vim')
  call neobundle#config({
      \ 'autoload' : {
      \   'commands' : 'JunkfileOpen', 
      \   'unite_sources' : ['junkfile', 'junkfile/new'], 
      \ }})
  call neobundle#untap()
endif

" }}}

" simple-javascript-indenter "{{{
if neobundle#tap('simple-javascript-indenter')
  call neobundle#config({
      \ 'autoload' : {
      \   'filetypes' : 'javascript',
      \ }})

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:SimpleJsIndenter_BriefMode = 1
  endfunction
  call neobundle#untap()
endif
" }}}

" vim-javascript-syntax "{{{
if neobundle#tap('vim-javascript-syntax')
  call neobundle#config({
      \ 'autoload' : {
      \   'filetypes' : 'javascript',
      \ }})
  
  function! neobundle#tapped.hooks.on_source(bundle)
    autocmd Filetype javascript call JavaScriptFold()
  endfunction
  call neobundle#untap()
endif
" }}}

" smartchr "{{{
if neobundle#tap('vim-smartchr')
  call neobundle#config({
      \ 'autoload' : {
      \   'insert' : 1,
      \ }})

  function! neobundle#tapped.hooks.on_source(bundle)
    " smart =
    inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
    inoremap <buffer> <expr> , smartchr#loop(', ', ',')
  endfunction
  call neobundle#untap()
endif
" }}}

" emmet "{{{
let bundle  =  neobundle#get('emmet-vim')
if neobundle#tap('emmet-vim')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:user_emmet_settings  =  {
          \ 'lang' : 'ja', 
          \ 'indentation' : '  ', 
          \ }
  endfunction
  call neobundle#untap()
endif
" }}}

" vim-anzu "{{{

if neobundle#tap('vim-anzu')
  nmap n <Plug>(anzu-n-with-echo)
  nmap N <Plug>(anzu-N-with-echo)
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)
  nmap <ESC><ESC> <Plug>(anzu-clear-search-status)
  call neobundle#untap()
else
  nmap <ESC><ESC> :nohlsearch<CR><ESC>
endif

" }}}

" accelerated-jk "{{{
if neobundle#tap('accelerated-jk')
  call neobundle#config({
      \ 'autoload' : {
      \   'mappings' : '<Plug>(accelerated_jk_', 
      \ }})

  nmap <silent>j <Plug>(accelerated_jk_gj)
  nmap <silent>k <Plug>(accelerated_jk_gk)
  call neobundle#untap()
endif

" }}}

" syntastic "{{{

if neobundle#tap('syntastic')
  " do not check while quitting by :wq, :x, ZZ...
  let g:syntastic_check_on_wq = 1
  " disable balloons
  let g:syntastic_enable_balloons = 0
  " let me jumps to the first detected error after cheking errors
  let g:syntastic_auto_jump = 1
  " opens syntastic's location list automatically
  let g:syntastic_auto_loc_list = 1
  " height of location list
  let g:syntastic_loc_list_height = 5

  " use chktex for check tex files
  let g:syntastic_tex_checkers = ['chktex']
endif

" }}}

" quickrun "{{{
if neobundle#tap('vim-quickrun')
  call neobundle#config({
      \ 'autoload' : {
      \   'commands' : 'QuickRun', 
      \   'mappings' : [
      \     '<Plug>(quickrun'
      \   ], 
      \   'function_prefix' : 'quickrun', 
      \ }})

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:quickrun_config = {
          \ "_" : {
          \   "runner" : "vimproc", 
          \   "runner/vimproc/updatetime" : "60", 
          \ }, 
          \
          \ 'c/asm' : {
          \   "command" : "gcc", 
          \   "exec" : "%c %o %s -S -o -", 
          \   "cmdopt" : "-m32 -O2", 
          \ },
          \ 
          \ 'tex' : {
          \   "command" : "latexmk", 
          \   "outputter" : "error", 
          \   "outputter/error/error" : "quickfix", 
          \   "exec" : "%c %o %s", 
          \ }, 
          \ }
  endfunction

  nnoremap <silent> <Leader>qr :QuickRun -mode n<CR>
  call neobundle#untap()
endif

" }}}

" tern_for_vim "{{{
if neobundle#tap('tern_for_vim')
  call neobundle#config({
      \ 'autoload' : {
      \   'filetypes' : ['javascript'], 
      \   'insert' : 1, 
      \   'commands' : 'Tern', 
      \ }})

  call neobundle#untap()
endif

"}}}

" lightline.vim "{{{
if neobundle#tap('lightline.vim')
  let g:lightline = {
        \ 'colorscheme' : 'hybrid', 
        \ 'active' : {
        \   'left' : [ [ 'mode', 'paste' ], 
        \              [ 'readonly', 'fugitive', 'filename', 'modified', 'anzu']], 
        \   'right' : [ [ 'syntastic', 'lineinfo' ], 
        \               [ 'percent' ], 
        \               [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ }, 
        \ 'component' : {
        \   'readonly' : '%{&filetype=="help"?"":&readonly?"\e0a1":""}',
        \   'modified' : '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
        \ }, 
        \ 'component_function' : {
        \   'mode' : 'MyMode', 
        \   'fugitive' : 'MyFugitive', 
        \   'anzu' : 'anzu#search_status'
        \ }, 
        \ 'component_expand' : {
        \   'syntastic' : 'SyntasticStatuslineFlag', 
        \ }, 
        \ 'component_type' : {
        \   'syntastic' : 'error', 
        \ }, 
        \ 'component_visible_condition': {
        \   'readonly' : '(&filetype!="help" && &readonly)', 
        \   'modified' : '(&filetype!="help" && (&modified||!&modifiable))'
        \ }, 
        \ 'separator' : { 'left' : "\ue0b0", 'right' : "\ue0b2" },
        \ 'subseparator' : { 'left' : "\ue0b1", 'right' : "\ue0b3" },
        \ }

  function! MyMode()
    return &ft == 'unite' ? 'Unite' : 
          \ winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  function! MyFugitive()
    if exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? "\ue0a0 " . _ : ''
    endif
    return ''
  endfunction

  call neobundle#untap()
else
  set statusline=%<%q%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=
  set statusline+=[%n]%{neobundle#is_installed('syntastic')?SyntasticStatuslineFlag():''}
  set statusline+=[D:%-4b\ H:%-4B][%l/%L,%-6(%c%V%)]%6P
endif

"}}}

" vim-coffee-script "{{{
if neobundle#tap('vim-coffee-script')
  call neobundle#config({
        \ 'autoload' : {
        \   'filetypes' : ['coffee'], 
        \   'commands' : 'Coffee', 
        \ }})

  call neobundle#untap()
endif
"}}}

" unite-colorscheme "{{{

"}}}

" eclim "{{{
let g:EclimCompletionMethod = 'omnifunc'

"if neobundle#is_installed('eclim')
"    if !exists('g:neocomplete#sources#omni#input_patterns')
"      let g:neocomplete#sources#omni#input_patterns = {}
"    let g:neocomplete#sources#omni#input_patterns.java = '\%(\h\w*\|)\)\.\w*'
"  endif
"endif

" }}}

if !has('vim_starting')
  " call on_source hook when reloading .vimrc
  call neobundle#call_hook('on_source')
endif

"}}}

if executable('zsh')
  set shell=zsh
endif

set secure
