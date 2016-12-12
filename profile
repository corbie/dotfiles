export HISTCONTROL=ignoredups
export HISTSIZE=50000
export EDITOR=/usr/bin/vim
shopt -s histappend

alias ls='ls -G'
alias tm='diskutil unmount /Volumes/*\ Mascheen'
alias ll='ls -l' 
alias pu='pushd'
alias po='popd'

EDITOR="/usr/bin/vi"
#PATH=$PATH":~/bin"
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
PS1="<<\u@\h>><\w> "

case "$TERM" in
screen|xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"; __git_ps1 "\n\w" "\n\u@\h> " ":{%s}"'
	;;
*)  
	;;
esac


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Command completion
## Git
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true
