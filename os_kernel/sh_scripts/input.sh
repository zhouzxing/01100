#!/bin/bash

factoria=1
echo "program: $(basename $0)"
echo "program param nums: $#"

if [ $# -ne 1 ];then
	echo "usage: $0 a"
else	
	for (( i=1; i <= $1; i++))
	do
		factoria=$[ $factoria * $i ]
	done
	echo "result: $factoria"
fi

#测试特殊命令行参数
for param in "$*"
do
	echo $param
done

echo "diff \$@"
for param in "$@"
do
	echo $param
done

echo "diff shift"
count=1
while [ -n "$1" ]
do
	echo "#$count param:$1"
	count=$[ $count+1 ]
	shift
done

