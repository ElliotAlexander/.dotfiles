#!/bin/bash

cd /home/elliot/

sudo yum update && sudo yum -y install zsh wget git tmux stow neovim
chsh -s /bin/zsh $(whoami)
echo "Your shell is now: $SHELL"


# Installing omzsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo "ZSH installed."

# For python
sudo yum install -y centos-release-scl

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
sudo yum install -y epel-release python-pip
sudo pip install docker-compose
sudo yum upgrade python*

# G++
sudo yum group install -y "Development Tools"

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
sudo yum install -y centos-release-scl rh-python36
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
source /home/elliot/.rvm/scripts/rvm
sudo rvm reload

echo "Installing Ruby 2.6"
sudo rvm install 2.6

sudo yum install -y the_silver_searcher

# Setup Perl Critics
echo "Installing Perl Critic and CPAN"
sudo yum install -y perl-CPAN
perl -MCPAN -e 'install Perl::Critic'

# Setup NVIM 
cd /home/elliot/.dotfiles
stow nvim vim zsh tmux profile 

# Generate an SSH key
ssh-keygen -t rsa -b 4096 -C "elliot@netcraft.com" -f /home/elliot/.ssh/id_rsa
echo "Public Key is:" 
cat /home/elliot/.ssh/id_rsa.pub
