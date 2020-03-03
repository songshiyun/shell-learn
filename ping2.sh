#!/bin/bash
#
#

IP_LIST="10.12.33.33 10.12.33.34 10.12.33.40"

for IP in $IP_LIST; do
	FAIL_COUNT=0
	for((i=1;i<=3;i++)); do
		if ping -c 1 $IP > /dev/null; then
			echo "ping id success: $IP"
			break
		else
			let FAIL_COUNT++
		fi
	done
	if [ $FAIL_COUNT -eq 3 ]; then
		 echo "$IP Ping is failure!"
	fi
done
