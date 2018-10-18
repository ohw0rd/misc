#!/bin/bash
#
# NAME - curler.sh
# Version 0.1
#
# SYNOPSIS
# bash ./curler.sh
#
# DESCRIPTION
# Takes the log file from packetTrail and runs the IPs against ipinfo.io to rip who the IP belongs to, and 
# then restructures the log output to stdout or "pt_curl.txt"
#
# AUTHOR
# Ethan Cudzilo, based on packetTrail by Juan Ortega (https://github.com/false00/packetTrail)
#
# HISTORY:
# Date(YYYY/MM/DD):     Version:        Modified By:    Description of Change:
# 2018-10-01             0.1            Ethan Cudzilo	Creation

# While loop to read through packetTrail log file
while read line;
do
	# Rips dest IP address and stores it in var $dest
	dest=$(echo $line | awk '{ print $11 }' | cut -c 5-)
	# Output IP to line along with org that owns it
	echo -n $dest " "
#	echo -n $line >> pt_curl.txt
	curl -s "ipinfo.io/$dest" | grep org | cut -c 10- 
done<trail.log
# End of script
