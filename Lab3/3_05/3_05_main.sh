#!/bin/bash

mkfifo pipe

./3_05_handler.sh &
./3_05_generator.sh

rm pipe
