#!/bin/bash
IFS.old=$IFS
IFS=$'\n'
for entry in $(cat /etc/passwd)
do
	echo "$entry"
	IFS=':'
	for item in $entry
	do
		echo "$item  "
	done
done

IFS=$IFS.old
