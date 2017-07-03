# aliases
alias sdr="screen -aAdr"
alias la="ls -A"
alias ll="ls -lAF"
alias grep='grep --exclude="*.svn*" --exclude="*.git*"'
alias mkpasswd="head -c16 /dev/urandom | xxd -ps"
alias mc="mc -b"
alias ls='ls --color=auto'
alias less='vimpager'

if [ -f /usr/bin/grc ]; then
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
fi

# bundler aliases
alias rails="bundle exec rails"
alias hanami="bundle exec hanami"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias foreman="bundle exec foreman"
alias sidekiq="bundle exec sidekiq"
alias cap="bundle exec cap"
alias mina="bundle exec mina"
alias heroku="$HOME/Soft/heroku-client/bin/heroku"
alias rgrep="grep --exclude-dir=Godeps --exclude-dir=node_modules --exclude-dir=log --exclude-dir=vendor --exclude-dir=tmp --exclude-dir=public --exclude-dir=.git --exclude=.swp -rn"
alias grep="grep --color=auto"
alias wiki="cd ~/wiki && vim index.md"
alias xwiki="cd ~/wiki && xvim index.md"

alias gulp-watch="./node_modules/.bin/gulp watch; notify-send -i error 'Gulp has crashed'"
alias weather="curl wttr.in/Moscow"
alias ag="ag --path-to-ignore ~/.agignore --nogroup"
alias vim="nvim"
