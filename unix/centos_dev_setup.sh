#!/bin/bash

cd /home/$USER/

sudo yum update && sudo yum -y install zsh wget git tmux
chsh -s /bin/zsh $(whoami)
echo "Your shell is now: $SHELL"


# Installing omzsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh


# Setup a default template.
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc

echo "ZSH installed."