if [ -d $HOME/.rbenv/bin ] ; then
  unset RUBYOPT
  PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
  source $HOME/.rbenv/completions/rbenv.zsh
fi
