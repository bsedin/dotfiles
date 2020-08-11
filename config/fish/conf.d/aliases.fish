# aliases
alias sdr="screen -aAdr"
alias ls='exa'
alias la="exa -a"
alias ll="exa -laF"
alias mkpasswd="head -c16 /dev/urandom | xxd -ps"
alias mc="mc -b"
alias cdp='cd (~/bin/cdp); clear'

if command -sq grc
  alias ping="grc --colour=auto ping"
  alias traceroute="grc --colour=auto traceroute"
  alias make="grc --colour=auto make"
  alias diff="grc --colour=auto diff"
  alias cvs="grc --colour=auto cvs"
  alias netstat="grc --colour=auto netstat"
  alias mount="grc --colour=auto mount"
  alias ifconfig="grc --colour=auto ifconfig"
  alias dig="grc --colour=auto dig"
  alias ps="grc --colour=auto ps"
end

alias rgrep="grep --exclude-dir=Godeps --exclude-dir=node_modules --exclude-dir=log --exclude-dir=vendor --exclude-dir=tmp --exclude-dir=public --exclude-dir=.git --exclude=.swp -rn"
alias grep="grep --exclude-dir=.git --color=auto"

alias ag="ag --path-to-ignore $HOME/.agignore --nogroup"
alias vim="nvim"

# Typos
alias igt="git"
alias gti="git"
alias gitst="git st"

# Ledger
# alias ledger="noglob ledger"
# alias "bin/ledger"="noglob bin/ledger"
#
# alias icat="kitty +kitten icat"
