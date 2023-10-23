#!/bin/bash
var1=$(echo "scale=3;10/3" | bc)
echo "the answer:" $var1

# 内敛重定向
var2=10
var3=20
var4=30

val=$(bc << EOF
scale = 4
a1 = $var1 * $var2
a2 = $var3 * $var4
a1 + a2
EOF
)

echo result: $val
