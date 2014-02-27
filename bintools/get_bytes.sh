#!/bin/bash
### get_bytes.sh file offset n
### returns $n bytes after $offset in $file

dd if=$1 skip=$2 count=$3 bs=1 2>&-
