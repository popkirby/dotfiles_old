# .zshrc


# source files {{{

# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# autojump
if [[ -s `brew --prefix`/etc/autojump.sh ]]; then
  source "`brew --prefix`/etc/autojump.sh"
fi

# travis gem
if [ -f "${HOME}/.travis/travis.sh" ]; then
  source "${HOME}/.travis/travis.sh"
fi

# }}}


# function definitions {{{

# zsh history search by peco {{{
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi

  BUFFER=$(\history -n 1 | \
           eval $tac | \
           peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

if which peco > /dev/null; then
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

# }}}

# }}}

