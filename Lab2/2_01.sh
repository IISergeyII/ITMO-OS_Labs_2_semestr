#!/bin/bash

processes=$(ps -U root --format pid,command | awk '{print $1" : "$2}')
cnt_processes=$(echo "$processes" | wc -l)
let "cnt_processes=cnt_processes-1"

echo "Processes started count is $cnt_processes" > 2_01.txt
echo "$processes" >> 2_01.txt
