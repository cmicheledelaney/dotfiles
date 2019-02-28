#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export VISUAL=vim
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias gcc='gcc -g -Wall -Wextra -Werror'
alias vsc='/usr/bin/code'

