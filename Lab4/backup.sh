#!/bin/bash

backupHomeDir="$HOME/"
sourceDir="$HOME/source/"
todayDate=$(date "+%F")

dircreated=0
backupPrefix="Backup-"
backupReport="$HOME/backup-report"
todaySec=$(date --date=$todayDate "+%s")
lastbackupDir=$(ls $backupHomeDir -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -3 -k2 | head -1)
lastbackupSec=$(date --date=$(ls $backupHomeDir -1 | grep -Eo "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -3 -k2 | head -1 | sed "s/^Backup-//") "+%s")

let dateDiff=($todaySec\-$lastbackupSec)/60/60/24

if [ "$dateDiff" -le 7 ]; then
    echo "dateDiff less 7"
    currentbackupDir=$backupHomeDir$lastbackupDir"/"
else
    echo "NOT dateDiff less 7"
    mkdir $backupHomeDir$backupPrefix$todayDate
    currentbackupDir=$backupHomeDir$backupPrefix$todayDate"/"
    dircreated=1
fi

if [ "$dircreated" == "1" ]; then
    echo "New backup. Date: "$todayDate". Directory: "$sourceDir". Files:" >> "$backupReport"
    for file in $(ls $sourseDir -1)
    do
        cp "$courseDir$file" "$currentbackupDir$file"
        echo "$file" >> "$backupReport"
    done
else
    echo "Updating backup. Date: "$todayDate". Directory "$currentbackupDir". " >> "$backupReport"
    
    for file in $(ls sourceDor -1)
    do
        currentfile=$currentbackupDir$file
        if [ -f $currentfile ]; then
            source_size=$(stat $sourceDir$file -c%s)
            actual_size=$(stat $currentfile -c%s)
            if [ "$source_size" != "$actual_size" ]; then
                mv $currentfile $currentfile"."$todayDate
                cp $sourceDirfile $currentfile
                echo "Found new version of "$file". Old version copied to "$file"."$todatDate"" >> $backupReport
            fi
        else
            cp $sourceDir$file $currentfile
            echo "New file "$file" copied" >> $backupReport
        fi
    done
fi

echo "=== Successfully backup ==="






















