#!/bin/bash

x=1
mode="+"

tail -f pipe |
while true; do
    read line_in
    case $line_in in
        "+")
            mode="$line_in"
            echo "sum mode"
        ;;
        "*")
            mode="$line_in"
            echo "mult mode"
        ;;
        "QUIT")
            echo "quit"
            killall tail
            exit 0
        ;;
        [0-9]*)
            case $mode in
            "+")
                x=$(($x + $line_in))
                echo $x
            ;;
            "*")
                x=$(($x * $line_in))
                echo $x
            ;;
            esac
        ;;
    *)
        echo "Handler: Error. Wrong argument"
        killall tail
        exit 1
    ;;
    esac
done
