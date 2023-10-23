#!/bin/bash

val1=2
val2=8
echo "nomal:" $(expr $val2 / $val1)
val3=$(expr $val1 / $val2)
echo "the result:" $val3

val4=8.8
echo "val4:" $val4
echo "float value:" $(expr $val4 / $val1)
