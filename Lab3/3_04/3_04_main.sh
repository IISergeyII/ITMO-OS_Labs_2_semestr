#!/bin/bash

./3_04_ps.sh &
pid1=$!

./3_04_ps.sh &
pid2=$!

./3_04_ps.sh &
pid3=$!

renice +13 -p $pid1

at now + 1 minute <<< "kill ${pdi1} ; kill ${pid2} ; kill ${pid3}"
