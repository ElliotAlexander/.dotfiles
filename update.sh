#!/bin/bash

echo "Copying..."
cp  -v ~/$1 .
git add *
git commit -am "Updated $1"
git push origin master
