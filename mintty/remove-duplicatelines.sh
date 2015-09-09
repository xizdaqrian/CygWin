#!/usr/bin/env bash
###########################################################
# Name: remove-duplicatelines.sh                          #
# Author: Rodney Fisk                                     #
# Email: xizdaqrian@gmail.com                             #
# Purpose: Remove duplicate lines from a group of files   #
# Parameters: FILESPEC - just as if using ls (*.txt, etc) #
# Variables: None                                         #
###########################################################

if [ ! "$1" ]; then
  echo "USAGE: ${0##/} [-h] [FILESPEC]"
fi

for file in $1; do
  # -o outputs back to the source file,
  # for an 'inplace' sort
  sort "$file" -o "$file"
  # include the 'inplace' script, to
  # enable inplace editing
  # Below removes duplicate consecutive
  # lines, leaving the original
  awk -i inplace '!a[$0]++' "$file"
done

# from the following:
# https://stackoverflow.com/questions/9377040/remove-duplicate-entries-using-a-bash-script

