#!/bin/fish

# direnv
set -x DIRENV_LOG_FORMAT ""
direnv hook fish | source

# rbenv
status --is-interactive; and rbenv init - fish | source
