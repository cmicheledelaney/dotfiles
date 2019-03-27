#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# get machine (Linux/Mac/Windows/other) {{{1
uname_output="$(uname -s)"
case "${uname_output}" in
	Linux*)			machine="Linux";;
	Darwin*)		machine="Mac";;
	CYGWIN*|MINGW*)	machine="Windows";;
	*)				machine="UNKNOWN:${uname_output}"
esac
# }}}
# configurations for Linux {{{1
if [[ "${machine}" == "Linux" ]]; then
	# SOURCE {{{2
	source ~/.pretty_bash_prompt
	# }}}
	# EVAL {{{2
	eval $(dircolors -b $HOME/.LS_COLORS)
	# }}}
	# EXPORTS {{{2
	# add my bin directory to the path
	export PATH="$PATH:~/bin"
	# set the default editor to vim
	export EDITOR=vim
	export VISUAL=vim
	# }}}
	# ALIASES {{{2
	alias gitc='git commit -m "$(curl http://whatthecommit.com/index.txt)"'
	alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
	alias gcc='gcc -Wall -Wextra -Werror'
	alias filechecker='sh ~/42FileChecker/42FileChecker.sh'
	alias python='python3'
	alias ls='ls --color=auto'
	alias la='ls -a'
	alias ll='ls -l'
	alias cat='rainbowcat'
	alias vsc='/usr/bin/code'
	# }}}
# }}}
# configurations for Mac {{{1
elif [[ "${machine}" == "Mac" ]]; then
	# SOURCE {{{2
	source ~/.pretty_bash_prompt
	# }}}
	# EXPORTS {{{2
	# make homebrew brew-locks directory
	mkdir -p /tmp/.$(whoami)-brew-locks
	# add the brew-path to the PATH
	export PATH="$HOME/.brew/bin:$PATH"
	# add my bin directory to the path
	export PATH="$PATH:~/bin"
	# set the default editor to vim
	export EDITOR=vim
	export VISUAL=vim
	# }}}
	# EVAL {{{2
	eval $(gdircolors -b $HOME/.LS_COLORS)
 	# }}}
	# ALIASES {{{2
	alias gitc='git commit -m "$(curl http://whatthecommit.com/index.txt)"'
	alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
	alias gcc='gcc -Wall -Wextra -Werror'
	alias filechecker='sh ~/42FileChecker/42FileChecker.sh'
	alias python='python3'
	alias ls='gls --color=auto'
	alias la='ls -a'
	alias ll='ls -l'
	alias cat='rainbowcat'
 	# }}}
fi
# }}}
