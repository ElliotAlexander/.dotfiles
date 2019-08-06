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
cd /usr/local && sudo mv bat-v0.7.1-x86_64-unknown-linux-musl bat


# Setup Docker service
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo usermod -aG docker $(whoami)

sudo systemctl enable docker.service
sudo systemctl start docker.service


# Setup docker-compose
sudo yum install -yepel-release
sudo yum install -y python-pip
sudo pip install -y docker-compose
sudo yum upgrade python*


# Setup node / npm
sudo yum install -y npm
sudo npm install -yg yarn

# Update to latest
sudo npm cache clean -f
sudo npm install -yg n
sudo n stable
