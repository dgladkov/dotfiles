#!/bin/zsh

# my favorite apps to use
export EDITOR='vim'
case `uname -s` in
  Darwin)
    export BROWSER='open'
    ;;
  Linux)
    export BROWSER='chromium-browser'
    ;;
esac

# completion
fpath=(~/.zshfuncs $fpath)
autoload -U compinit
compinit

autoload -U select-word-style
select-word-style normal

# correction
setopt correct

# misc improvements
setopt autocd
setopt extendedglob

#history
setopt hist_ignore_space
setopt hist_ignore_all_dups
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# my prompt
autoload -Uz vcs_info

precmd() {
  psvar=()
  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

zstyle ':vcs_info:*' formats ' %b'

PS1="%F{cyan}%n@%m%f %F{yellow}%~%f%(1v.%F{green}%1v%f.) %F{yellow}$%f "

# useful keybindings
bindkey "^W" vi-backward-kill-word
case `uname -s` in
  Darwin)
    bindkey "\e[5C" vi-forward-word # ctrl-left
    bindkey "\e[5D" vi-backward-word # ctrl-right
    ;;
  Linux)
    bindkey ";5C" vi-forward-word # ctrl-left
    bindkey ";5D" vi-backward-word # ctrl-right
    ;;
esac
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^J' accept-line

# show matching groups
zstyle ':completion:*:descriptions' format '%U%d%u'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %B%d%b'

# extenstions
alias -s html=$BROWSER

# virtualenv
export VIRTUALENV_USE_DISTRIBUTE=true
export WORKON_HOME=$HOME/.virtualenvs
source virtualenvwrapper.sh

# ls coloring
export LSCOLORS=dxfxcxdxbxegedabagacad

case `uname -s` in
  Darwin)
    alias ls='ls -G'
    alias grep='grep -G'
    ;;
  Linux)
    alias ls='ls --color=auto'
    alias grep="grep --color=auto"
    ;;
esac

# completing process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# ignore completion functions for commands don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache

# useful functions
pygl () { pygmentize $1 | less -r }

cd () {
    has_virtualenv() {
        if [ -e .venv ]; then
            workon `cat .venv`
        fi
    }
    builtin cd "$@" && has_virtualenv
}

devmailserver () {
    local HOST=${1:-"localhost:20025"} 
    echo "Starting development mail server at $HOST"
    python -m smtpd -n -c DebuggingServer $HOST
}

# useful aliases
alias sudo="sudo " # to make aliases work with sudo
alias json="python -m json.tool"
alias updick='/usr/bin/uptime | perl -ne "/(\d+) d/;print 8,q(=)x\$1,\"D\n\""'
alias wgetr='wget --random-wait -r -p -e robots=off -U "Mozilla/6.0 (Windows NT 6.2; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1"'
alias shutdownwin="net rpc shutdown -I ipAddressOfWindowsPC -U username%password"
alias 'ps?'='ps ax | grep '
alias coolwatch='watch -t -n1 "date +%T|figlet -f big"'
alias mysqldump_all='for db in $(mysql -BNe "show databases" | grep -v information_schema); do mysqldump5 $db | bzip2 > "$db.sql.bz2"; done'

# trick to force venv_cd to run in the new tab
cd .
