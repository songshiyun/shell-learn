#!/bin/bash
#生成为八位随机字符串
echo $RANDOM |md5sum | cut -c 1-8
#openssl base64 4
cat /proc/sys/kernel/random/uuid
