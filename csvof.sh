#!/bin/bash

extractFrom() {
	sed "s/<$1.*>\(.*\)<\/$1>/\1/"
}

getRows() {
	sed -e '/evenRow\|oddRow/,/<\/tr/!d' $1
}

getID() {
	grep -o "Click to display Transaction [0-9]*" $1 | grep -o '[0-9]*'
}

getDate() {
	grep -Eo '[0-9]+/[0-9]+/[0-9]+' $1
}

getStatus() {
	grep -EA1 "<!--.*status" $1 | grep "<td" | extractFrom td
}

getFiler() {
	sed -e '/<!--.*comittee/,/<\/td/!d' $1 | grep -A2 "<a" | 
	sed 's/<a.*//g' | sed 's/.*" >//g' | sed 's/--//g' |
	grep -v '^[[:space:]]*$' 
}

getType() {
	grep -A1 "<!--.*sub type" | grep "<td" | extractFrom td
}

getAmount() {
	grep -A1 "<!--.*contribution" | grep "<td" | extractFrom td
}

getLine() {
	echo "$1" | head -$2 | tail -1
}

getCSV() {
	header="ID,Date,Status,Filer,Type,Amount"
	rows=$(getRows $1)
	ids=$(echo "$rows" | getID)
	dates=$(echo "$rows" | getDate)
	status=$(echo "$rows" | getStatus)
	filers=$(echo "$rows" | getFiler)
	types=$(echo "$rows" | getType)
	amounts=$(echo "$rows" | getAmount)
	num_rows=$(echo "$ids" | wc -l)
	echo $header
	for i in $(seq 1 $num_rows); do
		echo $(getLine "$ids" $i),$(getLine "$dates" $i),\
$(getLine "$status" $i),$(getLine "$filers" $i),$(getLine "$types" $i),\
\"$(getLine "$amounts" $i)\"
	done
}

getCSV $(./getpage.sh $@)
