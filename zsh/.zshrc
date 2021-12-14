
export ZSH="$HOME/.oh-my-zsh"

HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="true"


# Magic Enter
MAGIC_ENTER_GIT_COMMAND="nocorrect git status -v && exag && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="nocorrect la && echo -e '\n'"

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


export SSH_KEY_PATH="~/.ssh/id"
export EDITOR=vim

export TERM=xterm-256color
export SPICETIFY_INSTALL="/home/elliot/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

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
alias c="clear"

alias g='git'
alias gp="git push"
alias gl="git pull --recurse-submodules"
alias gb="git --no-pager branch"

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

alias weather="curl https://v2.wttr.in/"
alias weather-southampton="curl https://v2.wttr.in/southampton"
alias weather-bath="curl https://v2.wttr.in/bath"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
