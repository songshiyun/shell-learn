#!/bin/bash

##
# 'NR==3{print $13}'： 打印第三行，第十三个字符（默认使用空格或者制表符分割）
## NR==3定位到第三行，{print $12}: 打印第十二个字符
# ARGC   命令行变元个数
# ARGV   命令行变元数组
# FILENAME   当前输入文件名
# FNR   当前文件中的记录号
# FS   输入域分隔符，默认为一个空格
# RS   输入记录分隔符
# NF   当前记录里域个数
# NR   到目前为止记录数
# OFS   输出域分隔符
# ORS   输出记录分隔符

DATE=$(date +%F" "%H:%M)
IP=$(ifconfig eth0 | set -n '2p' | awk -F " " '{print $2}' | awk -F ":" '{print $2}')
if ! which vmstat &>/dev/null; then
	echo "vmstat command no found, Please install procps package." 
    	exit 1
fi

US=$(vmstat |awk 'NR==3{print $13}')
SY=$(vmstat |awk 'NR==3{print $14}')
IDLE=$(vmstat |awk 'NR==3{print $15}')
WAIT=$(vmstat |awk 'NR==3{print $16}')
USE=$(($US+$SY))

if [ $USE -le 50 ]; then 
	echo "
    	Date: $DATE
    	Host: $IP
    	Problem: CPU utilization $USE
	"
fi
