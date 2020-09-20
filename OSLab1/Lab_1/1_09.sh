#!/bin/bash

find /var/log/* -name '*.log' | xargs wc -l | sort -nr |
    awk '{print "Total lines count in ", $2, " : ", $1}'
