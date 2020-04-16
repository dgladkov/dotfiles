# Disable XON/XOFF
stty -ixon

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export TERM=xterm-256color

# GNU and BSD (macOS) ls flags aren't compatible
ls --version &>/dev/null
if [ $? -eq 0 ]; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi

# Completion
fpath=(~/.zsh/completions $fpath)
autoload -U compinit
compinit

# Correction
setopt correct

# Change directory without cd
setopt autocd

# History
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Prompt
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
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# list all possible keycodes for different terms
bindkey "\e[1;5A" up-history
bindkey "\e[1;5B" down-history
bindkey "\e[1;5C" vi-forward-word
bindkey "\e[1;5D" vi-backward-word

bindkey "\e[5A" up-history
bindkey "\e[5B" down-history
bindkey "\e[5C" vi-forward-word
bindkey "\e[5D" vi-backward-word

bindkey "\e\e[5A" up-history
bindkey "\e\e[5B" down-history
bindkey "\e\e[C" vi-forward-word
bindkey "\e\e[D" vi-backward-word

bindkey ";5A" up-history
bindkey ";5B" down-history
bindkey ";5C" vi-forward-word
bindkey ";5D" vi-backward-word

# show matching groups
zstyle ':completion:*:descriptions' format '%U%d%u'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %B%d%b'

# completing process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

# to make aliases work with sudo
alias sudo="sudo "

eval "$(direnv hook zsh)"

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV)) "
  fi
}
setopt PROMPT_SUBST
PS1='$(show_virtual_env)'$PS1

