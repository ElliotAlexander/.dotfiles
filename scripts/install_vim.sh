#!/bin/bash

cd ~
yum install -y neovim tmux zsh git


git clone https://github.com/ElliotAlexander/.dotfiles


mkdir ~.config && mkdir ~.config/nvim
cp ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
cp ~/.dotfiles/nvim/.vimrc ~/.vimrc

cp ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
cp ~/.dotfiles/.zshrc ~/.zshrc

echo "Done with dotfiles"

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "Install OhMyZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



chsh -s $(which zsh) 


