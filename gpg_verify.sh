#!/bin/bash



while getopts ":sv" opt; do
  case ${opt} in
    v )
      SIG=$2
      FILE=$3
      gpg --no-options --keyid-format 0xlong --verify $SIG $FILE
      ;;
    s )
      KEY=$2
      gpg --import $2
      ;;
    \? ) echo "Usage: cmd [-s] [-v]"
      ;;
  esac
done
