# Environment
## Shell
export HISTCONTROL=ignoredups
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=100000
export UNAME_SYSTEM=$(uname -s)
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
  export EDITOR='/usr/local/bin/vi'
else
  export EDITOR='/usr/bin/vim'
fi
shopt -s histappend

alias d='docker'
alias dc='docker-compose'
alias hg='history | grep'
alias ls='ls -G'
alias ll='ls -l'
alias pu='pushd'
alias po='popd'
alias ws='cd ~/Workspace/'
alias cat='ccat'
alias did="vim +'normal Go' +'r!date' ~/did.txt"
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
  alias tm='diskutil unmount /Volumes/*\ Mascheen'
  alias ts='tmutil status'
  alias tl='tmutil listbackups'
  alias tll='tmutil latestbackup'
  alias tstop='tmutil stopbackup'
fi

case "$TERM" in
screen*|xterm*|rxvt*)
  PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"; __git_ps1 "\n${DIRSTACK[*]}$([[ -n $VIRTUAL_ENV ]] && echo :{${VIRTUAL_ENV##*/}})" "\n\u@\h> " ":{%s}"; history -a'
  ;;
*)
  ;;
esac
PS1="\n\w\n\u@\h> "

## gitlab-gem
export GITLAB_API_ENDPOINT=https://gitlab.com/api/v4
export GITLAB_API_PRIVATE_TOKEN=NsFdFgZeGbEk8YFxzzQy

## Go
export GOPATH=~/Workspace/go
export GOBIN=$GOPATH/bin
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$(go env GOPATH)/bin


# Command completion
## Git
git_completion_dir=/usr/local/etc/bash_completion.d
. $git_completion_dir/git-completion.bash
. $git_completion_dir/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true

## Docker
docker_completion_dir=/Applications/Docker.app/Contents/Resources/etc/
. $docker_completion_dir/docker.bash-completion
. $docker_completion_dir/docker-compose.bash-completion
export DOCKER_COMPLETION_SHOW_IMAGE_IDS=non-intermediate


# Functions
## SSH agent forwarding socket environment workaround
function refresh_socket {
  if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
    socket=`find /private/tmp -user $USER -type s -name Listeners 2>/dev/null | xargs ls -1t | head -1`
  else
    socket=`find /tmp -user $USER -type s -name agent.* 2>/dev/null | xargs ls -1t | head -1`
  fi
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
