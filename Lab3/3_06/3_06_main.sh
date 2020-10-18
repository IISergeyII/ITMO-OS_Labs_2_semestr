#!/bin/bash

./3_05_proc.sh &
pid=$!

./3_05_gen.sh $pid
