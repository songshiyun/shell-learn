#!/bin/bash

# awk -F '[ :\t|]' '{print $1}' file   按照正则表达式的值做为分隔符，这里代表空格、:、TAB、|同时做为分隔符。
#

DATE=$(date +%F" "%H:%M)
IP=$(ifconfig eth0 | sed -n '2p' | awk -F " "  '{print $2}' | awk -F ":" '{print $2}')
# awk '/Mem/ {print $2}': 显示记录中包含Mem的行， 打印第二个记录
TOTAL=$(free -m | awk '/Mem/ {print $2}')
USER=$(free -m | awk '/Mem/ {print $3-$6-$7}')
FREE=$(($TOTAL-$USER))

if [ $FREE -gt 1024 ]; then
	echo "
	Date: $DATE
	IP: $IP
	Problem: Total=$TOTAL,Use=$USE,Free=$FREE
	"
fi


