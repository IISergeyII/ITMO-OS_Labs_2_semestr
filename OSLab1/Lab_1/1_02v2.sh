#!/bin/bash

input_str=""
text=""

read input_str

if [[ "$input_str" = "q" ]]\
then
    exit
fi

while [[ "$input_str" != "q" ]]
do
    text="${text}{input_str}"
    read input_str
done

echo "$text"
