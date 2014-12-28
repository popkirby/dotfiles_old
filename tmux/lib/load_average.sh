#!/bin/sh
uptime | awk -F\  '{print int(( $(NF - 2)+$(NF - 1)+$NF) / 3  * 100) / 100 }'
