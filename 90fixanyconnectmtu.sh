#!/bin/bash

# this should be symlinked to /etc/NetworkManager/dispatcher.d/
# make sure this file is:
# - owned by root (chown root:root <filename>)
# - executable (chmod +x <filename>)
# you can check log at /var/log/syslog

INTERFACE=$1
STATUS=$2

if [ "$INTERFACE" == "tun0" ]
then
    case "$STATUS" in
        up)
	logger -s "fix mtu for cisco anyconnect triggered"
	sudo ifconfig tun0 mtu 1356
        ;;
        *)
        ;;
    esac
fi
