" Initialize
" ======================================================================

" use English.
language message C

" use '\' as <Leader>
let g:mapleader = '\'

" augroup for rc-scripts
augroup MyAutoCmd
  autocmd!
augroup END

if filereadable(expand('~/.secret_vimrc'))
  execute 'source' expand('~/.secret_vimrc')
endif

" neobundle initialization
if has('nvim')
  let s:neobundle_dir = expand('~/.nvim/bundle')
else 
  let s:neobundle_dir = expand('~/.vim/bundle')
endif

if has('vim_starting')
  " load neobundle.
  if finddir('neobundle.vim', '.;') != ''
    execute 'set runtimepath^=' .
          \ fnamemodify(finddir('neobundle.vim', '.;'), ':p')
  elseif &runtimepath !~ '/neobundle.vim'
    if !isdirectory(s:neobundle_dir . '/neobundle.vim')
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir . '/neobundle.vim'
    endif

    execute 'set runtimepath^=' . s:neobundle_dir . '/neobundle.vim'
  endif
endif

