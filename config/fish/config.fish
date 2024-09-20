#!/bin/fish

# direnv
set -x DIRENV_LOG_FORMAT ""
direnv hook fish | source

# rbenv
status --is-interactive; and rbenv init - fish | source

# You must call it on initialization or listening to directory switching won't work
# load_nvm > /dev/stderr
