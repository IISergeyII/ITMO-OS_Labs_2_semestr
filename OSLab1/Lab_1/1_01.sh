#!/bin/bash

a=$1
b=$2
c=$3

if [[ ( "$a" -gt "$b" ) && ( "$a" -gt "$c" ) ]]
then echo "$a is the greatest"
elif [[ ( "$b" -gt "$a" ) && ( "$b" -gt "$c" ) ]]
then echo "$b is the greatest"
else echo "$c is the greatest"
fi
