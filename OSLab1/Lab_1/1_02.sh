#!/bin/bash

read input_str

if [[ "$input_str" = "q" ]]
then
    exit
fi

echo "$input_str" > temp.txt
read input_str

while [[ "$input_str" != "q" ]]
do
  echo "$input_str" >> temp.txt
  read input_str
done

echo $(cat $"temp.txt")
