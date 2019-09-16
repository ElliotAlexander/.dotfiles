#!/bin/bash

perl -i -pe 'y|\r||d' $1
echo Done!

