#!/bin/bash

man bash | grep -oi "[a-z][A-Z]\{4,\}" | tr "[A-Z]" "[a-z]" | 
sort | uniq -c | sort -nr | head -3
