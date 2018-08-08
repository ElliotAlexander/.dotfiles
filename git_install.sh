#!/bin/bash

GPG_PUBLIC=094C0C8C5CBF06AE13758AA5628A8CBDEB12F285;

sudo apt-get install git

# git-config

#Set credential store to save passswords for an hour.
git config credential.helper store
git config --global user.email "ep1e16@soton.ac.uk"
git config --global user.name "ElliotAlexander"
git config --global core.editor "vim"
git config --global credential.helper 'cache --timeout=3600'


if gpg --list-keys $GPG_PUBLIC; then
	# Signing commits using GPG
	git config --global user.signingkey $GPG_PUBLIC
	# To set all commits to be signed by defaul
	git config --global commit.gpgsign true
else
	echo "GPG Key $GPG_PUBLIC not found."
fi
