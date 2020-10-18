#!/bin/bash


while true; do
	read line_in
	case "$line_in" in
		"TERM")
			kill -SIGTERM $1
			exit 0
		;;
		"+")
			kill -USR1 $1
		;;
		"*")
			kill -USR2 $1
		;;
		*)
			:
		;;
	esac
done
