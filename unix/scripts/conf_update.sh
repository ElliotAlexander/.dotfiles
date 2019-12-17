#!/bin/bash

cd ~ 
rm -fR ~/.dotfiles
git clone --recurse-submodules -q https://github.com/ElliotAlexander/.dotfiles ~/.dotfiles

cp ~/.dotfiles/unix/.vimrc ~/.vimrc
cp ~/.dotfiles/unix/zsh/.zshrc ~/.zshrc
cp ~/.dotfiles/unix/tmux/tmux.conf ~/.tmux.conf
cp ~/.dotfiles/unix/git/.gitconfig ~/.gitconfig

echo "Done. Remember to restart nvim."