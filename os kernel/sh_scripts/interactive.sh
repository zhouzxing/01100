#!/bin/bash

#用户交互
#echo -n 'enter your name: '
#\read -p "enter ur name: " name first last
#read -p "enter ur name: " 

#读取文件
count=1
cat /etc/passwd | while read line
do
	echo "#$count contents: $line"
	count=$[ $count+1 ]
done

#统计输入字符数
opt=y
while [ -n $opt ]
do
	read -n1 -p "enter your option: " opt
	case $opt in
		y|Y) echo
	       	echo "good continue"		
		if read -t 5 -p "enter ur name: " name; then
			echo "hi $name"
			if read -s -p "enter ur pass: " pass; then
				echo "$name: $pass"
			fi
		else
			echo "to slow"
		fi
		;;
		n|N)echo
		echo "bye"
		exit;;
	esac
done

