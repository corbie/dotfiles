# Environment
## Shell Options
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=100000
# shopt -s autocd     # automatically cd if first arg is a directory
shopt -s cdspell    # fix common spelling mistakes
shopt -s histappend # update history after each command
shopt -s nocaseglob # ignore case when matching

## Path
PATH=${PATH}:/usr/local/sbin

## Per-OS environment
export UNAME_SYSTEM=$(uname -s)
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
	export BASH_SILENCE_DEPRECATION_WARNING=1
	if [[ -d /opt/homebrew ]]; then
		export BREW_PREFIX='/opt/homebrew'
	else
		export BREW_PREFIX='/usr/local'
	fi
	export EDITOR="${BREW_PREFIX}/bin/vi"
	PATH=${BREW_PREFIX}/bin:$PATH
	PATH=${BREW_PREFIX}/sbin:$PATH
else
	export EDITOR='/usr/bin/vim'
fi

## Aliases
alias brewdump='brew bundle dump -v -f --describe'
alias c-='cd -'
alias cat='ccat'
alias cdd='cd ..'
alias cddd='cd ../..'
alias cdddd='cd ../../..'
alias cddddd='cd ../../../..'
alias cdddddd='cd ../../../../..'
alias d='docker'
alias dc='docker-compose'
alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias dt="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
alias dtt="GIT_DIR=${HOME}/.dotfiles GIT_WORK_TREE=${HOME} tig"
alias hg='history | grep -i'
alias kc='kubectx'
alias kn='kubens'
alias l1='ls -1'
alias lh='ls -lh'
alias ll='ls -l'
alias ls='ls -G'
alias mc='mc --nocolor'
alias po='popd'
alias pu='pushd'
alias rp='echo "Reloading ~/.profile"; source ~/.profile'
alias ws='cd ~/Workspace/'
alias va='. .venv/bin/activate'
alias vinit='python3 -m venv .venv'
alias vd='deactivate'
alias vn='python3 -m venv .venv'
if [[ $UNAME_SYSTEM == 'Darwin' ]]; then
	alias cdi='cd "${HOME}/Library/Mobile Documents/com~apple~CloudDocs"'
	alias pui='pushd "${HOME}/Library/Mobile Documents/com~apple~CloudDocs"'
	alias puw='pushd "${HOME}/Workspace"'
	alias tm='diskutil unmount /Volumes/*\ Mascheen'
	alias ts='tmutil status'
	alias tl='tmutil listbackups'
	alias tll='tmutil latestbackup'
	alias tstop='tmutil stopbackup'
fi

## Prompt
case "$TERM" in
screen* | xterm* | rxvt*)
	# the $DIRSTACK substitution of "~" for $HOME does not work in bash 4
	PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"; __git_ps1 "\n$([[ -n $VIRTUAL_ENV ]] && echo \>\>\> VENV:\(${VIRTUAL_ENV//$HOME/\~}\))\n${DIRSTACK[*]//$HOME/~}" "\n$(date "+[%Y-%m-%d %H:%M:%S]") \u@\h> " ":{%s}"; history -a'
	;;
*) ;;
esac
PS1="\n\w\n\u@\h> "

## AWS
export AWS_PROFILE=default

## Go
export GOPATH=~/Workspace/go
export GOBIN=$GOPATH/bin
PATH=${PATH}:${GOBIN}

## Java
export JAVA_HOME=/opt/homebrew/opt/openjdk

## MySQL
PATH=${PATH}:${BREW_PREFIX}/opt/mysql-client@8.4/bin

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Command completion
## AWS CLI
aws_completion_dir=${BREW_PREFIX}/etc/bash_completion.d
. $aws_completion_dir/aws_bash_completer

## Docker
docker_completion_dir=${BREW_PREFIX}/etc/bash_completion.d
. $docker_completion_dir/docker

## Git
git_completion_dir=${BREW_PREFIX}/etc/bash_completion.d
. $git_completion_dir/git-completion.bash
. $git_completion_dir/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true

## Kubectl
kubectl_completion_dir=${BREW_PREFIX}/etc/bash_completion.d
[[ -f $kubectl_completion_dir/kubectl ]] && . $kubectl_completion_dir/kubectl

## M
m_completion_dir=${BREW_PREFIX}/etc/bash_completion.d
. $m_completion_dir/m

## Make
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

## MAS
mas_completion_dir=${BREW_PREFIX}/etc/bash_completion.d
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

## AWS SSO login
function acontext {
	if [ "$1" == "" ]; then
		echo "Current AWS session"
		echo "----------"
		if aws sts get-caller-identity; then
			echo
			echo "AWS profile"
			echo "----------"
			aws configure list
			[ "$?" != "0" ] && echo "***********"
		fi
		return 0
	fi
	if ! aws sso login --profile "$1"; then
		echo "Could not log in to AWS"; return 1
	fi
	export AWS_PROFILE="$1"
	echo "Account ID: $(aws sts get-caller-identity | jq -r .Account)"
	aws configure list
}

## Utility functions
function print() {
	echo ">>> [$(time_now)] $1"
}
function print_debug() {
	[ "$DEBUG" == "1" ] && echo "### [$(time_now)] $1"
}
function print_err() {
	echo "*** [$(time_now)] $1"
}
function time_now() {
	date '+%Y-%m-%d %H:%M:%S' | tr -d '\n'
}

## Set kubectl context
function kcontext() {
	local current_context
	local contexts
	local pattern
	pattern="$1"
	function get_kubectl_context() {
		kubectl config current-context | tr -d '\n'
	}
	if [ "$1" == "" ]; then
		echo -e "Current kubectl context:"
		get_kubectl_context
		return
	fi
	current_context="$(get_kubectl_context)"
	if [[ "$current_context" =~ $pattern ]]; then
		print "kubectl current context now '$current_context'"
		return
	fi
	print "The current kubectl context does not match '${pattern}'"
	# `kubectl config get-contexts` does not support structured output so we need this mess
	contexts="$(kubectl config get-contexts --no-headers | sed -E -e 's/^[ \*]+([a-z:0-9\/-]+)[ ].+$/\1/')"
	for context in $contexts; do
		if [[ "$context" =~ $pattern ]]; then
			print "Changing active kubectl context"
			kubectl config use-context "$context"
			print "kubectl current context now '$(get_kubectl_context)'"
			return
		fi
	done
	print_err "Could not find a kubectl context matching '${pattern}'"
	print_err "Available contexts are:"
	echo "$contexts"
}


#if [[ -v $SSH_AUTH_SOCK && -S $SSH_AUTH_SOCK ]]; then
#  # SSH auth socket exists, NOP
#  true
#else
#  refresh_socket
#fi

# Added by OrbStack: command-line tools and integration
# source ~/.orbstack/shell/init.bash 2>/dev/null || :

# zoxide
if which zoxide > /dev/null; then
	eval "$(zoxide init --cmd cd bash)"
fi
