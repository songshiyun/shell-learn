#!/bin/bash
#输出一个颜色的数字

function echo_color() {
	if [ $1=="green" ]; then
		echo -e "\033[32;40m$2\033[0m"
	else if [ $1=="red" ]; then
		echo -e "\033[31;40m$2\033[0m"
	fi
}

#function echo_color() {
#    case $1 in
#        green)
#            echo -e "\033[32;40m$2\033[0m"
#            ;;
#        red)
#            echo -e "\033[31;40m$2\033[0m" 
#            ;;
#        *) 
#            echo "Example: echo_color red string"
#    esac
#}

echo_color
