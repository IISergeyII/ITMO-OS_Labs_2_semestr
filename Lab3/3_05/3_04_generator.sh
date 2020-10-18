#!/bin/bash

while true; do
    read line_in
    echo "$line_in" > pipe
    
    if [[ "$line_in" == "QUET" ]]; then
            echo "Successfully finished"
            exit 0
    fi
    
    if [[ "$line_in" != "+" && "$line_in" != "*" && "$line_in" =~ [0-9]+ ]]; then
            echo "Generator: Error. Wrong argument"
            exit 1
    fi

done
