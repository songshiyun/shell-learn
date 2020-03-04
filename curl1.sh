#!/bin/bash

##监控网站可用性

function check_url () {
	HTTP_CODE=$(curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" $1)
	if [ $HTTP_CODE -eq 200 ]; then
		continue
	fi
}

URL_LIST="www.baidu.com risk.rong360.com"
for URL in $URL_LIST; do
    check_url $URL
    check_url $URL
    check_url $URL
    echo "Warning: $URL Access failure!"
done
