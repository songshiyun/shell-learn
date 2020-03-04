#!/bin/bash
#。。
#     BEGIN 表示在处理任意行之前进行的操作。
# BEGIN{OFS="="}: 表示设置输出分隔符为“=”
#  awk  'BEGIN { FS="[: \t|]" } ，标识设置输入分隔符为 [: \t|],[]:标识或操作符
#  END {print "tom was found "count" times"}' file            END表示在所有输入行处理完后进行处理。
DATE=$(date +%F" "%H:%M)
IP=$(ifconfig eth0 |awk -F '[ :]+' '/inet addr/{print $4}')  
TOTAL=$(fdisk -l |awk -F'[: ]+' 'BEGIN{OFS="="}/^Disk \/dev/{printf "%s=%sG,",$2,$3}')
PART_USE=$(df -h |awk 'BEGIN{OFS="="}/^\/dev/{print $1,int($5),$6}')
for i in $PART_USE; do
    PART=$(echo $i |cut -d"=" -f1)
    USE=$(echo $i |cut -d"=" -f2)
    MOUNT=$(echo $i |cut -d"=" -f3)
    if [ $USE -gt 80 ]; then
        echo "
        Date: $DATE
        Host: $IP
        Total: $TOTAL
        Problem: $PART=$USE($MOUNT)
        "
    fi
done
