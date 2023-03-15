# Environment
## Shell Options
export HISTCONTROL=ignoredups
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=100000
shopt -s histappend

## Per-OS environment
export UNAME_SYSTEM=$(uname -s)
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
	export BASH_SILENCE_DEPRECATION_WARNING=1
	export EDITOR='/usr/local/bin/vi'
else
	export EDITOR='/usr/bin/vim'
fi

## Path
PATH=$PATH:/Users/corban.johnson/Workspace/eng-env

### Snowflake SnowSQL
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
	if [ -d /Applications/SnowSQL.app ]; then
		PATH=$PATH:/Applications/SnowSQL.app/Contents/MacOS
	fi
fi

## Aliases
alias cat='ccat'
alias cdi='cd "/Users/corban.johnson/Library/Mobile Documents/com~apple~CloudDocs"'
alias d='docker'
alias dc='docker-compose'
alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias ghpr="gh pr create"
alias hg='history | grep'
alias ll='ls -l'
alias lh='ls -lh'
alias dt="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias dtt="GIT_DIR=${HOME}/.dotfiles GIT_WORK_TREE=${HOME} tig"
alias ls='ls -G'
alias po='popd'
alias pu='pushd'
alias pud='pushd "/Users/corban.johnson/.dotfiles"'
alias pui='pushd "/Users/corban.johnson/Library/Mobile Documents/com~apple~CloudDocs"'
alias tfp='terraform plan -out temp.plan'
alias tfa='terraform apply temp.plan'
alias ws='cd ~/Workspace/'
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
	alias tm='diskutil unmount /Volumes/*\ Mascheen'
	alias ts='tmutil status'
	alias tl='tmutil listbackups'
	alias tll='tmutil latestbackup'
	alias tstop='tmutil stopbackup'
fi

## Prompt
case "$TERM" in
screen* | xterm* | rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"; __git_ps1 "\n${DIRSTACK[*]//$HOME/~}$([[ -n $VIRTUAL_ENV ]] && echo :{${VIRTUAL_ENV##*/}})" "\n\u@\h> " ":{%s}"; history -a'
	;;
*) ;;
esac
PS1="\n\w\n\u@\h> "

## gitlab-gem
export GITLAB_API_ENDPOINT=https://gitlab.com/api/v4
export GITLAB_API_PRIVATE_TOKEN=NsFdFgZeGbEk8YFxzzQy

## Go
export GOPATH=~/Workspace/go
export GOBIN=$GOPATH/bin
PATH=$PATH:$(go env GOPATH)/bin

## Java
export JAVA_HOME=/usr/local/Cellar/openjdk@11/11.0.16.1_1

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Command completion
## AWS CLI
aws_completion_dir=/usr/local/etc/bash_completion.d
. $aws_completion_dir/aws_bash_completer

## Docker
docker_completion_dir=/Applications/Docker.app/Contents/Resources/etc
. $docker_completion_dir/docker.bash-completion
. $docker_completion_dir/docker-compose.bash-completion
export DOCKER_COMPLETION_SHOW_IMAGE_IDS=non-intermediate

## Git
git_completion_dir=/usr/local/etc/bash_completion.d
. $git_completion_dir/git-completion.bash
. $git_completion_dir/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true

## M
m_completion_dir=/usr/local/etc/bash_completion.d
. $m_completion_dir/m

## MAS
mas_completion_dir=/usr/local/etc/bash_completion.d
. $mas_completion_dir/mas

# Functions
## SSH agent forwarding socket environment workaround
function refresh_socket {
	if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
		socket=$(find /private/tmp -user $USER -type s -name Listeners 2>/dev/null | xargs ls -1t | head -1)
	else
		socket=$(find /tmp -user $USER -type s -name agent.* 2>/dev/null | xargs ls -1t | head -1)
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
