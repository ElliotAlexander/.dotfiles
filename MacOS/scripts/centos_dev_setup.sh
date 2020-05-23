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


# For python
sudo yum install centos-release-scl

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

# G++ 
sudo yum group install "Development Tools" 

# Setup node / npm
sudo yum install -y npm
sudo npm install -yg yarn

# Update to latest
sudo npm cache clean -f
sudo npm install -yg n

sudo npm --loglevel silent root -g
sudo npm install -g neovim 

sudo npm install -g typescript
sudo n stable


# Python 
sudo yum install centos-release-scl
sudo yum install rh-python36
scl enable rh-python36 zsh
pip install lxml --user


# diff-so-fancy

sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > /usr/local/bin

# Install ruby

yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel \
   libyaml-devel libffi-devel openssl-devel make \
   bzip2 autoconf automake libtool bison iconv-devel sqlite-devel

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
curl -L get.rvm.io | bash -s stable
source /home/$USER/.rvm/scripts/rvm
rvm reload


echo "Installing Ruby 2.6" 
rvm install 2.6

sudo yum install -y the_silver_searcher
