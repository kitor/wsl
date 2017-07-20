#!/bin/bash

# check if script is not running already
pidfile=/var/run/wsl_init
if [ -f "$pidfile" ] && kill -0 `cat $pidfile` 2>/dev/null; then
    echo "WSL init is already running, aborting!"
    exit 1
fi
echo $$ > $pidfile

# add permission to write for all to /run
# /var/run is symlink to /run
# without this eg. screen will not work as non-root user
chmod go+w /run

# and fix some permissions for rsyslog
chmod g+w /dev/xconsole
chmod 770 /var/log
chgrp syslog /var/log

# run services
service rsyslog start
service ssh start
service sendmail start
service cron start
service dbus start

# loop to keep tilda running
while [ true ]; do
    if DISPLAY=:0 xset q &>/dev/null; then
        rm -r /home/kitor/.cache/tilda/locks/*
        su kitor -c 'DISPLAY=:0 tilda'
    else
        sleep 1;
    fi
done

