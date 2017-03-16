#!/bin/bash

#check if script is not running already
pidfile=/var/run/wsl_init
if [ -f "$pidfile" ] && kill -0 `cat $pidfile` 2>/dev/null; then
    echo "WSL init is already running, aborting!"
    exit 1
fi
echo $$ > $pidfile

service ssh start
service sendmail start
service cron start
while [ true ]; do
    if DISPLAY=:0 xset q &>/dev/null; then
        rm -r /home/kitor/.cache/tilda/locks/*
        su kitor -c 'DISPLAY=:0 tilda'
    else
        sleep 1;
    fi
done

