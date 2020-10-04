#!/bin/bash

for pid in $(ps -Ao pid)
do
    file_status="/proc/"$pid"/status"
    file_sched="/proc/"$pid"/sched"
    
    ppid=$(grep -Ehis "ppid" "$file_status" | grep -o "[0-9]\+")
    sum_exec_runtime=$(grep -Ehis "se\.sum_exec_runtime" "$file_sched" | awk '{print $3}')
    nr_switches=$(grep -Ehis "nr_switches" "$file_sched" | awk '{print $3}')
    
    if [ -z "ppid" ]
    then
        ppid=0
    fi
    
    if [ -z "$sum_exec_runtime" ] || [ -z "nr_switches" ]
    then
        ART=0
    else
        ART=$(echo "$sum_exec_runtime/$nr_switches" | awk '{print "%f", $0}')
    fi
    
    echo "$pid $ppid $ART"
done | sort -nk2 |
awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3""}'
