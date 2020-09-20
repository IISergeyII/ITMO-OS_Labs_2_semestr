#!/bin/bash

man bash | sed 's/\s/\n/g' | sort | uniq -c | sort -nr |
    awk 'length($2) > 3 {print "Word ", $2, " occurs ", $1, " times"}' | head -3
