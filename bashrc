#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# History
export HISTCONTROL=ignoreboth


# Options
shopt -s checkwinsize
shopt -s autocd


# Variables
export LANG=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8
export EDITOR=vim


# Functions
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}


# Keybindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


# Alias
alias grep='grep --color=auto'
alias ls='ls --color=auto'


# Prompt
PS1='[\u@\h \W]\$ '


# Local
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

