#! /usr/bin/bash
##
## Prints the first 10 random ports that don't exist in /etc/services or are currently listening on your computer
##

l="$(netstat -an|grep LISTEN|rev|cut -d. -f1|rev)"; for i in $(seq 1 65535|ruby -e 'puts STDIN.readlines.shuffle'); do if ! egrep -q "^$i\$" <(awk '{print $2}' /etc/services|cut -d/ -f1; echo "$l"); then echo "Available: ${i} "; fi; done |head -n 10
