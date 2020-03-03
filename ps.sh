#!/bin/bash
#
#

PORT_C=$(ss -anu | grep -c 123)
PS_C=$(ps -ef | grep ntpd | grep -vc grep)
if [ $PORT_C -eq 0 -o $PS_C -eq 0 ]; then
     echo "内容"
fi
