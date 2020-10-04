#!/bin/bash

file_before_temp="2_7_1.temp"
file_after_temp="2_7_2.temp"

ps aux | awk '{if ($6 != 0) print $2" "$6" "$11}' | sort -nk1 | tail -n +2 | head -n -6 > "$file_before_temp"
sleep 1m
ps aux | awk '{if ($6 != 0) print $2" "$6" "$11}' | sort -nk1 | tail -n +2 | head -n -6 > "$file_after_temp"


cat "$file_before_temp" | 
while read line
do
    pid=$(awk '{print $1}' <<< $line)
    mem_before=$(awk '{print $2}' <<< $line)
    cmd=$(awk '{print $3}' <<< $line)
    
    mem_after=$(cat "$file_after_temp" | awk -v id="$pid" '{if ($1 == id) print $2}')
    mem_delta=$(echo "$mem_after-$mem_before" | bc)
    
    echo $pid":"$cmd":"$mem_delta
    
done | sort -t ":" -nk3 | head -n 3


rm *.temp

    
    
    
    
