#!/bin/bash

sudo apt-get install git

# git-config
git config --global user.email "ep1e16@soton.ac.uk"
git config --global user.name "ElliotAlexander"
git config --global core.editor "vim"

if gpg --list-keys 626BE6CD; then
	# Signing commits using GPG
	git config --global user.signingkey 5A61A1B55914A21A718B7E114D975740C41F7630
	# To set all commits to be signed by defaul
	git config --global commit.gpgsign true
else
	echo "GPG Key 5A61A1B55914A21A718B7E114D975740C41F7630 not found."
fi
