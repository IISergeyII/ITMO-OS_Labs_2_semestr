#!/bin/bash

input_log = "/var/log/anaconda/X.log"

awk '$3 == "(WW)" {print $0}' $input_log | sed 's/(WW)/Warning:/' 
    > full.log


awk '$3 == "(II)" {print $0}' $input_log | sed 's/(WW)/Information:/' 
    >> full.log
