#!/bin/bash

echo "Copying..."
cp  -v ~/$1 .
git add *
# Explicitly add this - git notmally ignores .* files in .git add
git add $1
git commit -am "Updated $1"
git push origin master
