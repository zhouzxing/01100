#!/bin/bash
# 批量创建用户
IFS.old="$IFS"
input="accounts" #IFS.old=$IFS

#for info in $(cat $input)
#do
#	echo "account info :$info"
#	IFS=,
#done

# 思路：read -r a b c

while IFS=',' read -r userid name
do
	echo "account info: $name"
	useradd -c "$name" -m "$userid"
done < "$input"
IFS=$IFS.old
