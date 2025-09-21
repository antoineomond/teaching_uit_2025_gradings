#!/usr/bin/bash

rm -r /tmp/studentcode/*
cp -r * /tmp/studentcode/
ssh -t anomo6531@ificluster.ifi.uit.no "cd 3201-grading-assignment1/; bash --login"
