#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# SOURCE
source ~/.bash_prompt

# EXPORTS
# add my bin directory to the path
export PATH="$PATH:~/bin"
# set the default editor to vim
export EDITOR=vim
export VISUAL=vim

# ALIASES
alias gitc='git commit -m "$(curl http://whatthecommit.com/index.txt)"'
alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
alias gcc='gcc -Wall -Wextra -Werror'
alias filechecker='sh ~/42FileChecker/42FileChecker.sh'
alias python='python3'
alias ls='ls --color'
alias cat='rainbowcat'
alias vsc='/usr/bin/code'

