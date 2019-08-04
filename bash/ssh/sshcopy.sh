#!/bin/bash

set -euo pipefail

read -p "Enter a hostname: " hostname
read -p "Enter your username: " username

echo "Attempting to copy SSH key..."
ssh-copy-id username@hostname
