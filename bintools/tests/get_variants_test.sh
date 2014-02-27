#!/bin/bash
### get_variants_test.sh file
result=$(../get_variants.sh $1 $(head -1 $1) | wc -l)
passing_result=$(cat $1 | wc -l)
if [[ $result -eq $passing_result ]]; then
	echo "PASS"
	exit
fi
echo "FAIL"
