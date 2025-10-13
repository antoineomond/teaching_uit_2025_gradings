#!/usr/bin/bash

[[ -z $(ls /tmp | grep studentcode) ]] && mkdir /tmp/studentcode
[[ -z $(mount -l | grep /mnt/users/anomo6531/studentcode) ]] && sshfs anomo6531@ificluster.ifi.uit.no:/mnt/users/anomo6531/studentcode/ /tmp/studentcode
rm -r /tmp/studentcode/*
cp -r * /tmp/studentcode/
ssh -t anomo6531@ificluster.ifi.uit.no 'ssh -t $(/share/ifi/available-nodes.sh | head -n 1) "bash --login -c \"cd studentcode; exec bash\""'
