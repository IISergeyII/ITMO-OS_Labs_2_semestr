#!/bin/bash

if [[ $PWD =~ $HOME/* ]]
then
    echo "$HOME"
    exit 0
else
    echo "Not a home derictory"
    exit 1
fi
