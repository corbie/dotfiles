export HISTCONTROL=ignoredups
export HISTSIZE=50000
export EDITOR='/usr/bin/vim'
shopt -s histappend

alias ls='ls -G'
alias tm='diskutil unmount /Volumes/*\ Mascheen'
alias ll='ls -l'
alias pu='pushd'
alias po='popd'
alias ws='cd ~/Workspace/'
alias cat='ccat'

case "$TERM" in
screen|xterm*|rxvt*)
  PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"; __git_ps1 "\n\w" "\n\u@\h> " ":{%s}"'
  ;;
*)
  ;;
esac

if [ -e /usr/share/terminfo/78/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# SSH agent forwarding socket environment workaround
function refresh_socket {
  socket=`find /tmp -user $USER -type s -name agent.* 2>/dev/null | xargs --max-line=5 | ls -1 | head -1`
  if [ -S $socket ]; then
    export SSH_AUTH_SOCK=$socket
  fi
}

#if [[ -v $SSH_AUTH_SOCK && -S $SSH_AUTH_SOCK ]]; then
#  # SSH auth socket exists, NOP
#  true
#else
#  refresh_socket
#fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GOPATH=~/Workspace/go
export GOBIN=$GOPATH/bin

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$(go env GOPATH)/bin
PS1="<<\u@\h>><\w> "

# Command completion
## Git
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true

## Docker
. /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
. /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
. /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
