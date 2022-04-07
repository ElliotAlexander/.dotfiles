#!/bin/bash

STATUS=`tailscale status --peers=false`

if [[ $STATUS =~ stopped ]]; then
    echo "Down"
else
    echo "Up"
fi
