export ZSH="$HOME/.oh-my-zsh"

HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="true"


# Magic Enter
MAGIC_ENTER_GIT_COMMAND="git status -v && exag && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="lsda && echo -e '\n'"

ZSH_THEME="cloud"

export FZF_BASE=/path/to/fzf/install/dir

plugins=(
	brew 
	dirhistory
	extract
	fancy-ctrl-z
	git
	github
	globalias
	magic-enter
	osx 
	pip 
	python 
	ssh-agent
	tmux
	web-search
	z
)


export SSH_KEY_PATH="~/.ssh/rsa_id"
EDITOR=vim 


alias bat="/usr/local/bat/bat"

# Aliases
alias la="ls -AXb --group-directories-first --sort=extension"
alias lsda="lsd -A --group-dirs first --classify"
alias exag="exa -ahlT -L=1  -s=extension --git --group-directories-first"
alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv"
alias ln="ln -sv"
alias q="exit"
alias fdir='find . -type d -name'
alias ffil='find . -type f -name'
alias cat="bat"
alias c="clear"

alias g='git'
alias gp="git push"
alias gl="git pull --recurse-submodules"
alias gb="git --no-pager branch"

alias tmux="tmux -u"
alias tmuxm="tmux new-session \; split-window -h \; split-window -v \; attach"


alias syse="sudo systemctl enable"
alias sysd="sudo systemctl disable"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"

source $ZSH/oh-my-zsh.sh
