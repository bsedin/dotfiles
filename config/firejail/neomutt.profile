ignore private-etc

noblacklist ${HOME}/bin/preview-html
noblacklist ${HOME}/.mbsyncrc
noblacklist ${HOME}/.password-store

include /etc/firejail/neomutt.profile

include whitelist-dotfiles.inc
include whitelist-dotfiles-private.inc

whitelist ${HOME}/bin/preview-html
whitelist ${HOME}/.mbsyncrc
whitelist ${HOME}/.password-store
