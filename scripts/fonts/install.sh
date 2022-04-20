#!/bin/bash

echo "Grabbing nerd fonts"
cd ~/
mkdir tmp && cd tmp
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh FiraCode
