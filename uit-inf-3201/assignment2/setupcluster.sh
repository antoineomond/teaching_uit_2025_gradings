#!/usr/bin/bash

[[ -z $(ls /tmp | grep studentcode) ]] && mkdir /tmp/studentcode
[[ -z $(mount -l | grep /mnt/users/anomo6531/3201-grading-assignment2/) ]] && sshfs anomo6531@ificluster.ifi.uit.no:/mnt/users/anomo6531/3201-grading-assignment2/ /tmp/studentcode
rm -r /tmp/studentcode/*
cp -r * /tmp/studentcode/
ssh -t anomo6531@ificluster.ifi.uit.no 'ssh $(/share/ifi/available-nodes.sh | head -n 1); bash --login;'
