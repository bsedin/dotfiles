# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000

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

setopt   notify pushdtohome cdablevars autolist # correct globdots
setopt   recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus rcquotes mailwarning
setopt   no_bare_glob_qual no_extended_glob

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
export PAGER="less"

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

# Load all files from .shell/zshrc.d directory
if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*.zsh; do
    source $file
  done
fi
