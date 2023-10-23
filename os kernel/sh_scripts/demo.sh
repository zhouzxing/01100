#!/bin/bash
#echo "user info: $USER"
#echo "user info: $USER"
#echo "uid:$UID"
#echo "home:$HOME"
#echo "cost: \$58"

# 自定义变量
days=10
guest=macro
echo "$guest check $days days ago"
days=20
sdate=`date`
swho=$(who)
echo datetime:$sdate
echo login:$swho

today=$(date +%y%m%d)
ls -li /bin > log.$today
