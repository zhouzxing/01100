#!/bin/bash

if bpwd
then
	echo "it worked!"
else
	echo "no such command"
	if grep ddd /etc/passwd;then
		echo "ddd exits!"
	else
		echo "ddd not exits!"
	fi
fi

#case

case $USER in
	root)
		echo "root user logged";;
	macro|eee)
		echo "welcome visitor"
		echo "enjoy";;
	*)
		echo "try again";;
esac

