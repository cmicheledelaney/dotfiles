#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# checks if my_prompt exists, clones it if necessary and sets the prompt to my_prompt
if [[ ! -d ~/my_prompt ]]; then
  git clone https://github.com/cmicheledelaney/my_prompt
fi


# check if my bin directory with my applications in it exists; if it doesn't, create one
if [[ ! -d ~/bin ]]; then
  mkdir ~/bin
fi

# checks if rainbowcat exists, clones it if necessary and moves the binary into the path
if [[ ! -f ~/bin/rainbowcat ]]; then
  if [[ ! -d ~/rainbowcat ]]; then
	if git clone https://github.com/cmicheledelaney/rainbowcat; then
	  make -C ~/rainbowcat
	  mv ~/rainbowcat/rainbowcat ~/bin
	  rm -rf rainbowcat
	fi
  else
	  echo "rainbowcat directory already exists"
  fi
fi

# clones the 42project script if necessary and moves it into the bin
if [[ ! -f ~/bin/42project ]]; then
  if curl https://raw.githubusercontent.com/cmicheledelaney/42project/master/42project > ~/bin/42project; then
    chmod +x ~/bin/42project
  fi
fi


# SOURCE
source ~/my_prompt/.my_prompt

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

