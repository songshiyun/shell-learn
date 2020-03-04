#!/bin/bash

#sed -n :只处理满足条件的行， -p: 打印， ‘2p’:打印第二行, '3,9p'：打印第3到9行
#awk: -F： 定义文本分割符号，$2: 第二个参数
#

ifconfig eth0 | sed -n '2p' | awk -F " " '{print $2}' | awk -F ":" '{print $2}'
