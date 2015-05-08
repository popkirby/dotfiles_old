# zsh environment {{{

# set language to japanese
export LANG="ja_JP.UTF-8"

# set dotfiles path
export DOTFILES="${HOME}/dotfiles"

# set .z* files path to $DOTFILES
export ZDOTDIR="${DOTFILES}/zsh"

# }}}

# paths {{{
path=(
  # homebrew
  /usr/local/bin
  /usr/local/bin
  ${HOME}/homebrew/bin

  # tex
  /usr/texbin

  # rbenv
  ${HOME}/.rbenv/bin

  # nodebrew
  ${HOME}/.nodebrew/current/bin

  # go
  /usr/local/opt/go/libexec/bin
  ${HOME}/go/bin

  # MacVim
  /Applications/MacVim.app/Contents/MacOS

  ${path}
)

# remove duplicate path / null path
typeset -gU fpath path cdpath mailpath
setopt extended_glob
path=(
  ${^path}(N-/)
)

fpath=(
  ${DOTFILES}/zsh/.zsh.prezto
  ${DOTFILES}/zsh/zsh-completion-functions
  ${fpath}
)

# }}}

# other environments {{{

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# go
export GOPATH="${HOME}/go:${HOME}/Dropbox/Programming/go"

# misc
export EDITOR="vim"
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export GTK_PATH="/usr/local/lib/gtk-2.0"
export GTK_PIXBUF_MODULEDIR="/usr/local/lib/gdk-pixbuf-2.0/2.10.0/loaders"
export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig:${PKG_CONFIG_PATH}"
export CHKTEXRC="${DOTFILES}/tex"

# }}}

# load .zshenv.local if exists
if [[ -f "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
