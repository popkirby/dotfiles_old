#!/bin/sh
/usr/bin/pmset -g ps | awk '{ if (NR == 2) print "batt:" $2 "(" $4 "/" $3 ")" ; }' | sed "s/;//g"

