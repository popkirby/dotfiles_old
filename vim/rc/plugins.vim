" Plugins
" ----------------------------------------------------------------------

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
      return pumvisible() ? neocomplete#close_popup()."\<CR>" : "\<CR>"
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

  let g:vimfiler_as_default_explorer = 1
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
      \   'filetypes' : ['javascript', 'jsx', 'javascript.jsx'],
      \ }})

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:SimpleJsIndenter_BriefMode = 1

    function! GetJavascriptIndent()
      return GetJsIndent()
    endfunction
  endfunction
  call neobundle#untap()
endif
" }}}

" yajs.vim "{{{
if neobundle#tap('yajs.vim')
  
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

  " use eslint for javascript
  let g:syntastic_javascript_checkers = ['eslint']

  " use c++11
  if executable("clang++")
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
  endif

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
        \   'readonly' : '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
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

" vim-go {{{
if neobundle#tap('vim-go')
  call neobundle#config({
        \ 'autoload' : {
        \   'filetypes' : ['go'], 
        \ }})

  let g:gocomplete#system_function = 'vimproc#system'

  call neobundle#untap()
endif

" }}}
  
" clang_complete "{{{
if neobundle#tap('clang_complete')
  if neobundle#is_installed('neocomplete.vim')
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0

    let s:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib'
    if isdirectory(s:clang_library_path)
      let g:clang_library_path = s:clang_library_path
    endif

  endif

  let g:clang_user_options = '-std=c++11 -stdlib=libc++'

  call neobundle#untap()
endif
" }}}

" vim-easy-align " {{{
if neobundle#tap('vim-easy-align')
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  call neobundle#untap()
endif

" }}}

" vim-jsx "{{{
let g:jsx_ext_required = 0
if neobundle#tap('vim-jsx')

  call neobundle#untap()
endif

" }}}

if !has('vim_starting')
  " call on_source hook when reloading .vimrc
  call neobundle#call_hook('on_source')
endif

