#set ft=sh
# ~/.bash_profile
#


# ENV VARS
# {{{
 
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && export LESSOPEN="|/usr/bin/lespipe.sh %s"

# Custom PATH
# {{{
if [[ -d "${HOME}/bin" ]]; then
	export PATH=$PATH:"/home/javo/bin"
fi
# }}}

# TERM settings
# {{{
#Set term & color term
TERM="rxvt-unicode"
COLORTERM="rxvt-unicode-256color"
# }}}

# BROWSER settings
# {{{
if [[ -n "${DISPLAY}" ]]; then
	BROWSER=firefox
else
	BROWSER=elinks
fi
# }}}

# HIST settings
# {{{
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# }}}

# }}}
 
[[ -f ~/.bashrc ]] && . ~/.bashrc
