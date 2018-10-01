#!/bin/bash

# This script is essential for switching between linux / macos a lot, removing uneeded control chars that break bash scripts 
perl -i -pe 'y|\r||d' $1
echo Done!

