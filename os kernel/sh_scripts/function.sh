#!/bin/bash
. ./libs.sh
echo "libs user called"
echo "addem: $(addem 1 2)"
echo "multem: $(multem 2 2)"
echo "addem: $(divem 2 0)"


function echo0 {
	echo "function call"
}
echo "try to call by name: "
#echo0

function ret_sta_f {
	read -p "input a value:" value
	value=$[ $value * 2 ]
	echo "value: $value"
	return $value
}
#ret_sta_f
#echo "return state: $?"

function ret_val_f {
	read -p "input num:" num
	echo $[ $num + 1]
}
#result=$(ret_val_f)
#echo "return value: $result"

#命令行参数
function add_f {
	if [ $# -eq 0 ] || [ $# -gt 2 ]; then
		echo -1
	elif [ $# -eq 1 ]; then
		echo $[ $1 + $1 ]
	elif [ $# -eq 2 ]; then
		echo $[ $1 + $2 ]
	fi
}
#result=$(add_f 10 20)
#echo $result

#result=$(add_f 10 20 30)
#echo $result

#result=$(add_f 10)
#echo $result

#result=$(add_f)
#echo $result
#测试变量作用域
g_value=10
l_value=8
function var_life_f {
	local l_value=$[$value*2]
	echo "func inner g_var: $g_value"	
	echo "func acc l_var: $l_value"
	echo 88
}

#read -p "input a value:" value
value=8
#value=$(var_life_f)
#echo "value: $value"


#数组变量
function array_f {
	echo "params: $@"
	local arr=$1
#	local g_v=9
#	echo "local var: $g_v"
	echo "values:${arr[*]}"
}
arr=(1 2 3)
#array_f ${arr[*]}
#g_v=8

#values=$(array_f ${arr[*]})
#echo "values: ${values[*]}"

echo "original arr: ${arr[*]}"
function arr_v_f {
	local arr=$(echo $@)
	echo "func local arr: ${arr[*]}"
	
	echo ${arr[*]}
}
#arr=$(arr_v_f ${arr[*]})
#echo "return arr: ${arr[*]}"
if arr0=$(arr_v_f ${arr[*]});then
	echo "return arr: ${arr0[*]}"
fi


#递归
function fac {
	if [ $1 -eq 1 ]; then
		echo 1
	else
		local temp=$1
		echo $[$temp * $(fac $[$temp-1])]
	fi
}
result=$(fac 5)
echo "factor: $result"
