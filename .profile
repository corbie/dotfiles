# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/corban.johnson/.docker/bin"
# End of Docker Desktop section.

# ꟛ

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
	export EDITOR="${BREW_PREFIX}/bin/nvim"
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
screen* | xterm* | rxvt* | tmux*)
	# the $DIRSTACK substitution of "~" for $HOME does not work in bash 4
	PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"; __git_ps1 "\n$([[ -n $VIRTUAL_ENV ]] && echo \>\>\> VENV:\(${VIRTUAL_ENV//$HOME/\~}\))\n${DIRSTACK[*]//$HOME/~}" "\n$(date "+[%Y-%m-%d %H:%M:%S]") \u@\h> " ":{%s}"; history -a'
	;;
*) ;;
esac
PS1="\n\w\n\u@\h> "

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
BREW_BASH_COMPLETION_DIR="${BREW_PREFIX}/etc/bash_completion.d"
## Docker
docker_completion_dir=${BREW_BASH_COMPLETION_DIR}
[[ -f $docker_completion_dir/docker ]] && . $docker_completion_dir/docker

## Git
git_completion_dir=${BREW_BASH_COMPLETION_DIR}
. $git_completion_dir/git-completion.bash
. $git_completion_dir/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true

## Google CLI
google_cli_completion_dir=${BREW_BASH_COMPLETION_DIR}
[[ -f $google_cli_completion_dir/google-cloud-sdk ]] && . $google_cli_completion_dir/google-cloud-sdk

## google_cli
google_cli_completion_dir=${BREW_BASH_COMPLETION_DIR}
[[ -f $google_cli_completion_dir/google_cli ]] && . $google_cli_completion_dir/google_cli

## Kubectl
kubectl_completion_dir=${BREW_BASH_COMPLETION_DIR}
[[ -f $kubectl_completion_dir/kubectl ]] && . $kubectl_completion_dir/kubectl

## M
m_completion_dir=${BREW_BASH_COMPLETION_DIR}
[[ -f $m_completion_dir/m ]] && . $m_completion_dir/m

## Make
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

## MAS
mas_completion_dir=${BREW_BASH_COMPLETION_DIR}
[[ -f $mas_completion_dir/mas ]] && . $mas_completion_dir/mas

# Functions
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

# zoxide
if which zoxide > /dev/null; then
	eval "$(zoxide init --cmd cd bash)"
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/corban.johnson/.lmstudio/bin"
# End of LM Studio CLI section
