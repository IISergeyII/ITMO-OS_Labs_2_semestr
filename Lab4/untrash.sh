#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error. Wrong number of arguments"
    exit 1
fi

trashDir=~/.trash
trashLog=~/.trash.log

if [ ! -d "$trashDir" ]; then
    echo "Error! .trash does not exist"
    exit 1
fi

if [ ! -f "$trashLog" ]; then
    echo "Error! .trash.log. does not exist"
    exit 1
fi

if [ -z $(grep "$1" "$trashLog") ]; then
    echo "Error! File $1 does not exist"
    exit 1
fi

restFile=/home/user/lab4/$1

for i in $(grep -h $1 $HOME/.trash.log)
do
    glPath=$(echo $i | awk -F ":" '{print $1}')
    fileId=$(echo $i | awk -F ":" '{print $2}')
    if [ $restFile == $glPath ]; then
        rmFile=$HOME/.trash/$fileId
        if [ -e $rmFile ]; then
            echo "Do you want to restore file -$glPath ? (y - yes, n - no)"
            read answer
            
            if [ "$answer" == "y" ]; then
                if [ -d $(dirname $glPath) ]; then
                    if [ -e $glPath ]; then
                        echo "Duplicate name! Type new name"
                        read newName
                        ln "$rmFile" "$(dirname $glPath)/$newName"
                    else
                        ln $rmFile $glPath
                    fi
                else
                    echo "Folder $(dirname $glPath) is no longer exists"
                    ln $rmFile $HOME/$1
                fi
                rm $rmFile
                    
                grep -v $fileId $HOME/.trash.log > $HOME/.trashTemp.log
                mv $HOME/.trashTemp.log $HOME/.trash.log
            fi
        fi
    fi
done








