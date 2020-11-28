#!/bin/bash

fileTrashName=$1
homeTrash=$HOME/.trash
homeLog=$HOME/.trash.log

if [ $# -ne 1 ]; then
    echo "Error. Wrong number of arguments"
    exit 1
fi

if [ ! -f ""$PWD"/"$1"" ]; then
    echo "Error. File "$1" not found"
    exit 1
fi

if [ ! -d $homeTrash ]; then
    mkdir $homeTrash
fi

currentTrashFile=$(date +%s)
ln $fileTrashName "$homeTrash/$currentTrashFile"

rm $fileTrashName

if [ ! -e $homeLog ]; then
    touch $homeLog
fi

echo "PWD/$fileTrashName:$currentTrashFile" >> $homeLog

echo "=== File successfully removed ==="














