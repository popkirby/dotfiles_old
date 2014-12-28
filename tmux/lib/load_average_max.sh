#!/bin/sh
uptime | awk -F\  '{print ($(NF - 2) > $(NF - 1)) ? (($NF > $(NF - 2)) ? $NF : $(NF - 2)) : (($NF > $(NF - 1)) ? $NF : $(NF - 1))}'
