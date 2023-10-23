#!/bin/bash

var=10
while [ $var -gt 0 ]
do
	echo $var
	var=$[$var - 1]
done


# until
var=100
until [ $var -eq 0 ]
do
	echo until:$var
	var=$[ $var-1 ]
done
