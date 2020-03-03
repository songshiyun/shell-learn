#!/bin/bash
#
#

IP_LIST="10.12.33.33 10.12.33.80 10.12.33.40"
for ip in $IP_LIST; do
    NUM=1
    while [ $NUM -lt 3 ]; do
        if ping -c 1 $ip > /dev/null; then
             echo "$ip Ping is successful."
             break
        else
             FAIL_COUNT[$NUM]=$ip
             let NUM++
        fi
    done
    if [ ${#FAIL_COUNT[*]} -eq 3 ]; then
	 echo "${FAIL_COUNT[1]} Ping is failure!"
	 unset FAIL_COUNT[*]
    fi
done
