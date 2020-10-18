#!/bin/bash

cur_data_time=$(data '+%d.%m.%y_%H:%M:%S')

mkdir ~/test &&
{
    echo "catalog test was created successfully" > ~/report ; touch ~/test/$cur_data_time ;
}

cur_data_time2=$(data '+%d.%m.%y_%H:%M:%S')
site_to_ping="www.net_nikogo.ru"

ping -c1 $site_to_ping 
|| echo "${cur_data_time2} Error while trying to ping ${site_to_ping}" >> ~/report
