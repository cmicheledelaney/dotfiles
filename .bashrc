#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# get machine (Linux/Mac/Windows/other) {{{1
uname_output="$(uname -s)"
case "${uname_output}" in
  Linux*)     machine="Linux";;
  Darwin*)    machine="Mac";;
  CYGWIN*|MINGW*) machine="Windows";;
  *)        machine="UNKNOWN:${uname_output}"
esac
# 1}}}
# configurations for all machines {{{1
# setting pretty-bash-prompt {{{2
export PRETTY_PROMPT_SYMBOL='>>>'
source ~/.pretty_bash_prompt
# 2}}}
# setting PATH variable {{{2
# add my bin directory to the path
export PATH="$PATH:~/bin"
# 2}}}
# setting default editors {{{2
# set the default editor to vim
export EDITOR=vim
export VISUAL=vim
# 2}}}
# school settings {{{2
export MAIL='cmicheledelaney@gmail.com'
export USER='michele'
# 2}}}
# ALIASES {{{2
alias gitc='git commit -m "$(curl http://whatthecommit.com/index.txt)"'
alias gcc='gcc -Wall -Wextra -Werror'
alias filechecker='sh ~/42FileChecker/42FileChecker.sh'
alias python='python3'
alias cat='rainbowcat'
alias vsc='/usr/bin/code'
alias gits='git status'
# 2}}}
# 1}}}
# configurations for Linux {{{1
if [[ "${machine}" == "Linux" ]]; then
  # settings for ls {{{2
  eval $(dircolors -b $HOME/.LS_COLORS)
  # 2}}}
  # ALIASES {{{2
  alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
  alias ls='ls --color=auto'
  alias la='ls -a'
  alias ll='ls -l'
  # 2}}}
# 1}}}
# configurations for Mac {{{1
elif [[ "${machine}" == "Mac" ]]; then
  # settings for ls {{{2
  eval $(gdircolors -b $HOME/.LS_COLORS)
  # 2}}}
  # brew settings {{{2
  # make homebrew brew-locks directory
  mkdir -p /tmp/."$(whoami)"-brew-locks
  # add the brew-path to the PATH
  export PATH="$HOME/.brew/bin:$PATH"
  # 2}}}
  # ALIASES {{{2
  alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
  alias ls='gls --color=auto'
  alias la='ls -a'
  alias ll='ls -l'
  # 2}}}
fi
# 1}}}
