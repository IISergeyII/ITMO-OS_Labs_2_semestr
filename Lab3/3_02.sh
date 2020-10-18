#!/bin/bash

at now + 2 minutes -f ./3_01.sh

tail -n 1 -s 10 -f ~/report 
