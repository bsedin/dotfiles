ignore private-etc

noblacklist ${HOME}/bin/preview-html
noblacklist ${HOME}/.mbsyncrc
noblacklist ${HOME}/.password-store
noblacklist ${HOME}/.msmtprc
noblacklist ${HOME}/.config/msmtp
noblacklist ${HOME}/.config/nvim
noblacklist /usr/share/nvim
noblacklist ${HOME}/.local/share/nvim/

include /etc/firejail/neomutt.profile

include whitelist-dotfiles.inc
include whitelist-dotfiles-private.inc

whitelist ${HOME}/bin/preview-html
whitelist ${HOME}/.mbsyncrc
whitelist ${HOME}/.password-store
whitelist ${HOME}/.msmtprc
whitelist ${HOME}/.config/msmtp
whitelist ${HOME}/.config/nvim
whitelist /usr/share/nvim
whitelist ${HOME}/.local/share/nvim/
