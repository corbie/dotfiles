export HISTCONTROL=ignoredups
export HISTSIZE=50000
export EDITOR=/usr/bin/vim
shopt -s histappend

alias ls='ls -G'
alias tm='diskutil unmount /Volumes/Time\ Mascheen'
alias ll='ls -l' 
alias pu='pushd'
alias po='popd'

EDITOR="/usr/bin/vi"
#PATH=$PATH":~/bin"
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
PS1="<<\u@\h>><\w> "

case "$TERM" in                                                                                                                                                 
screen|xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"'
	;;
*)  
	;;
esac


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
