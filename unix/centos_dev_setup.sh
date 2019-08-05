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


# Setup Bat

wget -O bat.zip https://github.com/sharkdp/bat/releases/download/v0.7.1/bat-v0.7.1-x86_64-unknown-linux-musl.tar.gz
tar -xvzf bat.zip -C /usr/local
cd /usr/local && mv bat-v0.7.1-x86_64-unknown-linux-musl bat
cd ~