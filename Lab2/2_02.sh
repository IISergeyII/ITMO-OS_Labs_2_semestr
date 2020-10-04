#!/bin/bash

ps -Ao pid,command | grep "/sbin/" | awk '{print $1}'
