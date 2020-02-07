export ZSH="$HOME/.oh-my-zsh"


HIST_STAMPS="yyyy-mm-dd"
ENABLE_CORRECTION="true"


# Magic Enter
MAGIC_ENTER_GIT_COMMAND="git status -v && exag && echo -e '\n'"
MAGIC_ENTER_OTHER_COMMAND="lsda && echo -e '\n'"
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

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
	zsh-syntax-highlighting
  	zsh-autosuggestions
)


export SSH_KEY_PATH="~/.ssh/rsa_id"
export EDITOR=vim 


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
alias dcd="docker container rm $(docker ps -a -q)"
alias dck="docker container kill $(docker ps -q)"

alias weather="curl https://v2.wttr.in/"
alias weather-southampton="curl https://v2.wttr.in/southampton"
alias weather-bath="curl https://v2.wttr.in/bath"




POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_BATTERY_VERBOSE=false
#POWERLEVEL9K_BATTERY_STAGES=($'\u2581 ' $'\u2582 ' $'\u2583 ' $'\u2584 ' $'\u2585 ' $'\u2586 ' $'\u2587 ' $'\u2588 ')
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false


POWERLEVEL9K_RPROMPT_PREFIX='%{'$'\e[3A''%}' 
POWERLEVEL9K_RPROMPT_SUFFIX='%{'$'\e[3B''%}' 

POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=$'\u2502'
PROMPT_BLANK="${POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX}\n"

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❱ "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="${PROMPT_BLANK}%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context battery dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time  ram )


POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

neofetch

POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=1

# Set iTerm2 tab title text
function title_text {
    echo -ne "\033]0;"$*"\007"
}
title_text Luca

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/elliot/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/elliot/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/elliot/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/elliot/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/elliot/perl5"; export PERL_MM_OPT;

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Set height settings, + preview a file before opening
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
# Setup ignore for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias vifi='vim $(fzfi)'

