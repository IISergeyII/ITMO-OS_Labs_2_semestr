#!/bin/bash

backupHomeDir="$HOME/"
restoreDir="$HOME/restore/"
backupPrefix="Backup-"

latestBackup=$(find $backupHomeDir$backupPrefix* -maxdepth 0 | sort -n | tail -n 1)"/"

if [ ! -d "$restoreDir" ]; then
    mkdir $restoreDir
fi

if [ -z "$latestBackup" ]; then
    echo "Error. Not any backup found"
    exit 1
fi

for file in $(ls $latestBackup -1)
do
    if [ "$(echo $file | grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}")" == "" ]; then
        cp $latestBackup$file $restoreDir$file
        echo "File "$file" copied"
    fi
done

echo "=== Successfully upback ==="

















