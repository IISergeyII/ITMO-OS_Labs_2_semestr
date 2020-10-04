#!/bin/bash

grep "VmRSS" /proc/*/status | head -n -2 | sed "s/[^0-9.]\+/ /g" | sed "s/ //"| 
sort -nk2 | head -1 | awk '{print "PID: "$1" VmRSS: "$2}'
   
