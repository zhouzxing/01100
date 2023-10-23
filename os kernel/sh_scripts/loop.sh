#!/bin/bash

#for item in $(ls -li ./)
for item in ./*
do
	if [ -d $item ];then
		echo "$item is directory"
	elif [ -f $item ];then
		echo "$item is file"
	fi
#	echo $item
done > loop_out.log

for (( i=1; i <= 10; i++ ))
do
	echo "num: $i"
done >> loop_out.log


for (( i=1; i <= 8; i++ ))
do
	echo "outside : $i"

	for (( j=1; j <= 8; j++ ))
	do
		echo "inside: $j"
	done

done >> loop_out.log
