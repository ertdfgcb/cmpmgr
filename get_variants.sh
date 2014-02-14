#!/bin/bash
### get_variants.sh file name
### gets the variants of $name in $file

file=$1; shift
regex="$(echo $@ | sed 's/ / \\|/g')\|$(echo $@ | tr -d ' ')"

grep -i "$regex" $file
