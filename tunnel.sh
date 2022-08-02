#!/bin/bash
# Released under GPLv3+ Licence
# Arash Baheri<arashbaheri@icloud.com>, 2022

if [[ $EUID -ne 0 ]]; then
           echo "This script must be run as root." 
              exit 1
fi

#start
export SHELL=/bin/bash
ssh -D 8080 -fCqNT -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes {REMOTE_SERVER_USERNAME}@{REMOTE_SERVER_IP}
