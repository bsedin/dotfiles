# aliases
alias sdr='screen -aAdr'
alias ls='eza'
alias la='eza -a'
alias ll='eza -laF'
alias mkpasswd='head -c16 /dev/urandom | xxd -ps'
alias mc='mc -b'
alias cdp='cd (~/bin/cdp); clear'
alias cx='container exec'

alias rgrep='grep --exclude-dir=Godeps --exclude-dir=node_modules --exclude-dir=log --exclude-dir=vendor --exclude-dir=tmp --exclude-dir=public --exclude-dir=.git --exclude=.swp -rn'
alias grep='grep --exclude-dir=.git --color=auto'

alias ag='ag --path-to-ignore $HOME/.agignore --nogroup'

# Typos
alias igt='git'
alias gti='git'
alias gitst='git st'

# Ledger
# alias ledger='noglob ledger'
# alias 'bin/ledger'='noglob bin/ledger'
#
# alias icat='kitty +kitten icat'

alias dark="/usr/bin/kitty +kitten themes --reload-in=all Gruvbox Dark"
alias light="/usr/bin/kitty +kitten themes --reload-in=all Gruvbox Light"
