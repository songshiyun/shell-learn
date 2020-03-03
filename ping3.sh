#!/bin/bash
#
#
function ping_status() {
	 if ping -c 1 $IP >/dev/null; then
       		 echo "$IP Ping is successful."
       		 continue
   	 fi
}

IP_LIST="10.12.33.40 10.12.33.50 10.12.33.60"
for IP in $IP_LIST; do
	ping_status
	ping_status
	ping_status
	echo "$IP Ping is failure!"
done
