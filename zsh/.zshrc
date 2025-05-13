export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE=/path/to/fzf/install/dir

HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="false"

# Magic Enter
MAGIC_ENTER_GIT_COMMAND="ll && nocorrect git status -s && git --no-pager diff --staged && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="nocorrect ll && echo -e '\n'"
#
ZSH_THEME="cloud"


plugins=(
	brew
	dirhistory
	extract
	fancy-ctrl-z
	git
	github
	globalias
	magic-enter
	macos
	pip
	python
	ssh-agent
	tmux
	web-search
	z
	docker
	docker-compose
)

export EDITOR=nvim
export TERM=xterm-256color

# # Aliases
alias bat="/usr/local/bat/bat"
alias la="ls -AXb --group-directories-first --sort=extension"
alias lsda="lsd -A --group-dirs first --classify"
alias exag="exa -ahlT -L=1  -s=extension --git --group-directories-first"
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -v"
alias ln="ln -sv"
alias q="exit"
alias fdir='find . -type d -name'
alias ffil='find . -type f -name'
alias c="clear"

alias g='git'
alias gp="git push"
alias gl="git pull --recurse-submodules"
alias gb="git --no-pager branch"
alias gch="git checkout"

alias tmux="TERM=xterm-256color tmux -u"
alias tmuxm="TERM=xterm-256color tmux new-session \; split-window -h \; split-window -v \; attach"
alias tmuxn="TERM=xterm-256color tmux new -s "

alias updatezsh="git clone http://github.com/elliotalexander/dotfiles && \
    find ./dotfiles/ -name '.zshrc' -exec mv {} ~/.zshrc && \
       rm -Rf dotfiles "

alias syse="sudo systemctl enable"
alias sysd="sudo systemctl disable"
alias systa="sudo systemctl start"
alias systo="sudo systemctl stop"
alias sysr="sudo systemctl restart"
alias syss="systemctl status"
alias dc="docker-compose"
alias dcu="docker-compose up"
alias k=kubectl
alias tf="terraform"
alias tfa="terraform apply"
alias tfp="terraform plan"
alias tg="terragrunt"
alias tga="terragrunt apply"
alias tgi="terragrunt init"
alias k="kubectl"
alias kgn="kubectl get nodes"
alias weather="curl https://wttr.in/bristol"
alias weather-southampton="curl https://wttr.in/southampton"
alias weather-bath="curl https://wttr.in/bath"
#
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export CLOUDSDK_PYTHON=/usr/bin/python3.8

source ~/zsh/kubernetes.sh
source ~/zsh/prompt.zsh
PROMPT=$(echo $PROMPT | sed 's/(base) //')
#
# Start tmux
if [ "$TMUX" = "" ]; then tmux; fi
export PATH=$PATH:/home/elliot/.spicetify
#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/tmp/google-cloud-sdk/path.zsh.inc'; fi
#
# The next line enables shell command completion for gcloud.
if [ -f '/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/tmp/google-cloud-sdk/completion.zsh.inc'; fi

unalias gc
alias gc="git commit -m"

