#!/bin/bash

#自定义用户库
function addem {
	echo $[$1+$2]
}
 
function multem {
	echo $[$1*$2]
}

function divem {
	if [ $2 -ne 0 ];then
		echo $[$1 / $2]
	else
		echo -1
	fi
}
