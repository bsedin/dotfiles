ssh-add -l > /dev/null 2>&1
if [ "$?" == 2 ]; then
  test -r $HOME/.ssh-agent && eval "$(<$HOME/.ssh-agent)" > /dev/null 2>&1

  ssh-add -l > /dev/null 2>&1
  if [ "$?" == 2 ]; then
    (umask 066; ssh-agent > $HOME/.ssh-agent)
    eval "$(<$HOME/.ssh-agent)" > /dev/null
    ssh-add
  fi
fi
