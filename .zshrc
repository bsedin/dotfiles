# Добавляем ~/bin в PATH
if [ -d $HOME/bin ] ; then
  PATH=$HOME/bin:$PATH
fi

# autoload colors && colors


# aliases
alias sdr="screen -aAdr"
alias la="ls -A"
alias ll="ls -lAF"
alias grep='grep --exclude="*.svn*" --exclude="*.git*"'
alias iddqd="sudo -s"
alias mkpasswd="head -c16 /dev/urandom | xxd -ps"
# alias mc="mc -b"
alias ls='ls --color=auto'
alias less='vimpager'
# fix_mp3() { find -iname '*.mp3' -print0 | xargs -0 mid3iconv -eCP1251 --remove-v1 }
# mpg2flv() { ffmpeg -i $1 -ar 22050 -ab 32 -f flv -s 320x240 `echo $1 | awk -F . '{print $1}'`.flv }
mcd() { mkdir $1; cd $1 }
newday() { mcd `date +%F` }
c() { awk "{ print \$$1 }" }
ed2pull() { for i in `ls ./engines`; do echo "./engines/$i"; cd ./engines/$i; git pull; cd ../..; done; }
ed2st() { for i in `ls ./engines`; do echo "./engines/$i"; cd ./engines/$i; git st; cd ../..; done; }

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#Дописывание файла истории
setopt appendhistory
#Игнорировать повторения команд
setopt  HIST_IGNORE_ALL_DUPS
#Игнорировать лишние пробелы
setopt  HIST_IGNORE_SPACE
#Удалять пустые строки
setopt  HIST_REDUCE_BLANKS
#Не пищим при дополнении и ошибках
unsetopt beep
#Перейти в директорию, если набрали путь без команды cd
setopt AUTO_CD

# setopt CORRECT_ALL
# Вопрос на автокоррекцию
# SPROMPT='zsh: Исправить '\''%R'\'' на '\''%r'\'' ? [Yes/No/Abort/Edit] '

setopt   notify globdots pushdtohome cdablevars autolist # correct

setopt   recexact longlistjobs

setopt   autoresume histignoredups pushdsilent noclobber

setopt   autopushd pushdminus rcquotes mailwarning extendedglob



# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kressh//.zshrc'
bindkey -e
autoload -U zcalc

autoload -Uz compinit
compinit
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

zstyle ':completion:*' menu no
# End of lines added by compinstall

PS1="$(print '%{\e[1;32m%}%n@%m%{\e[0m%}') $(print '%{\e[1;36m%}%T%{\e[0m%}') $(print '%{\e[1;34m%}%~') $(print '%{\e[1;34m%}%(!.#.$) %{\e[0m%}')"
PS2="$(print '%{\e[1;34m%}>%{\e[0m%}')"
# RPROMPT="$(print '%{\e[1;36m%}[%T]%{\e[0m%}') %y%b"

eval `dircolors`

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
export GREP_COLOR='1;32'

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

myip() {links -source http://www.formyip.com/ |grep The | awk {'print $5'}}

## key binds Pgup pgdown, home, end

bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey " " magic-space ## do history expansion on space

# для kill и killall
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'

limit stack 8192 # лимит объёма памяти, выделеной под стек, дабы не переполнялся
limit core 0  # Выключаем запись дампов упавших в корку программ
umask 022   # Установка атрибутов доступа создаваемых файлов


autoload -U pick-web-browser
alias -s {html,htm,mht}=pick-web-browser

export LESS="-R"

unsetopt nomatch

# Установка нормального поведения клавиш Delete, Home, End и т.д. Запустится программка, которая попросит Вас поочередно нажимать клавиши, которые она будет запоминать. После появится каталог ~/.zkbd, в котором должен появится файлик xterm. Должен, но появится там файлик с несколько другим именем, поэтому ручками его переименовываем в xterm.

# autoload zkbd
# [[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
# [[ -f ~/.zkbd/$TERM ]] && source ~/.zkbd/$TERM
# [[ ! -f ~/.zkbd/$TERM ]] && zkbd

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


# SSH – автозаполнение хостов, юзеров. Пробелов между %% быть не должно.
# hosts=(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\*}%%,*})
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*:(ssh|scp):*' tag-order '! users'

# Отображение в заголовке окна терминала информации о номере консоли, пути и выполняемой команде
precmd()
{
[[ -t 1 ]] || return
case $TERM in
*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]2;[%~] :: %l\a"
;;
esac
}
preexec() {
[[ -t 1 ]] || return
case $TERM in
*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]2;<$1> [%~] :: %l\a"
;;
esac
}

# shopt -s extglob; if [[ -z $DISPLAY ]] && ! pgrep X &>/dev/null; then tput setaf 3; tput bold; read -t 5 -p 'Start X? [Y/n] '; tput sgr0; [[ -z $REPLY || $REPLY = [Yy]?([Ee][Ss]) ]] && startx; fi

export LANGUAGE="en_US:en_GB:en"

# RVM stuff
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# rbenv stuff
unset RUBYOPT

PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source $HOME/.rbenv/completions/rbenv.zsh

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
alias vagrant="BUNDLE_GEMFILE=$HOME/Soft/vagrant/Gemfile bundle exec vagrant"
alias vimb="HTTP_PROXY='http://localhost:8118' vimb"
alias chromium="chromium --proxy-server='localhost:8118'"
alias grep="grep --color=auto"
alias bdocker="DOCKER_HOST=tcp://10.8.0.1:2375 docker"
alias wiki="cd ~/wiki && vim index.md"
alias gwiki="cd ~/wiki && gvim index.md"

alias gulp-watch="./node_modules/.bin/gulp watch; notify-send -i error 'Gulp has crashed'"
alias weather="curl wttr.in/Moscow"
alias ag="ag --path-to-ignore ~/.agignore"

export PATH="$HOME/.dynamic-colors/bin:$PATH"

#export PATH="$HOME/Soft/vagrant/bin:$PATH"

# Google SDK
export CLOUDSDK_PYTHON=/usr/bin/python2
# The next line updates PATH for the Google Cloud SDK.
source '/home/kressh/Soft/google-cloud-sdk/path.zsh.inc'
# The next line enables bash completion for gcloud.
source '/home/kressh/Soft/google-cloud-sdk/completion.zsh.inc'

source $HOME/.dynamic-colors/completions/dynamic-colors.zsh

function git-commit-random() {
  curl -s http://whatthecommit.com/index.txt | git commit -em
}
