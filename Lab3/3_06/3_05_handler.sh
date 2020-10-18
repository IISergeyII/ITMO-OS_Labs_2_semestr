#!/bin/bash

x=1
mode="+"

term() {
	echo "TERM"
	exit 0
}

usr1() {
	mode="+"
}

usr2() {
	mode="*"
}

trap 'term' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while true; do
	case "$mode" in
		"+")
			x=$(($x + 2))
		;;
		"*")
			x=$(($x * 2))
		;;
	esac
	sleep 1
	echo $x
done
