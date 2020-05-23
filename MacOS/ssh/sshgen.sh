#!/bin/bash

read -p "Enter a password: "  password
read -p "Enter a comment: "  comment
ssh-keygen -t rsa -b 4096 -P $password -C $comment
echo "Done. "
