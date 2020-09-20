#!/bin/bash

printf "Menu: \n1 - Nano \n2 - Vim \n3 - Links \n4 - Exit\n"

read command

if [[ "$command" - eq 1 ]]
then
    nano
elif [[ "$command" - eq 2 ]]
    vi
elif [[ "$command" - eq 3 ]]
    links
elif [[ "$command" - eq 4 ]]
then
    exit
else
    echo "Unsupported command"
fi
