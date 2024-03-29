
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE=/path/to/fzf/install/dir

HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="false"

# Magic Enter
MAGIC_ENTER_GIT_COMMAND="exag && nocorrect git status -v && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="nocorrect exag && echo -e '\n'"

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


export EDITOR=vim
export TERM=xterm-256color

# Without this, QT 5 applications won't work correctly
export QT_QPA_PLATFORMTHEME=qt5ct

# Aliases
alias bat="/usr/local/bat/bat"
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

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Perl 5
PATH="/home/elliot/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/elliot/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/elliot/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/elliot/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/elliot/perl5"; export PERL_MM_OPT;

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:/snap/bin/:$HOME/.rvm/bin"
eval "$(ssh-agent)"
PATH="$HOME/.local/bin:$PATH"

# Krew
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=/home/elliot/bin:$PATH

# OCI
[[ -e "/home/elliot/lib/oracle-cli/lib/python3.8/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/elliot/lib/oracle-cli/lib/python3.8/site-packages/oci_cli/bin/oci_autocomplete.sh"

# Go is annoying
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin
export PATH="$(go env GOPATH)/src/github.com/terraform-docs/terraform-docs/bin/$(uname | tr '[:upper:]' '[:lower:]')-amd64/terraform-docs:$PATH"

# Terragrunt caching
export TERRAGRUNT_DOWNLOAD=/home/elliot/dev/infrastructure/.terragrunt_cache

export CLOUDSDK_PYTHON=/usr/bin/python3.8

source ~/zsh/kubernetes.sh
source ~/zsh/prompt.zsh
PROMPT=$(echo $PROMPT | sed 's/(base) //')

# Start tmux
if [ "$TMUX" = "" ]; then tmux; fi

export PATH=$PATH:/home/elliot/.spicetify

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/tmp/google-cloud-sdk/completion.zsh.inc'; fi

# Start pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

unalias gc
alias gc="git commit -m"
