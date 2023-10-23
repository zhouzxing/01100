#!/bin/bash
#查找path所有可执行文件
IFS.old=$IFS
IFS=:
for dir in $PATH
do
	echo "current path: $dir"
#	IFS='\t'
#	for exe in $(ls -a $dir)
	for exe in $dir/*
	do
		if [ -f $exe ] && [ -x $exe ];then			
			echo "$exe  "
		fi
	done
done
IFS=$IFS.old
