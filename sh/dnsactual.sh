#!/bin/sh

# From http://freedns.afraid.org/scripts/dnsactual.sh.txt
# Modified to work in restricted shell accounts

#######################################################################
#  application name: dnsactual
#  other files: dnsactual.conf (keeps the last updated ip)
#               dnsactual.log  (register date & time of the actualization)
#  Author: Ernest Danton
#  Date: 01/29/2007
##############################################################################

if test -f dnsactual.conf
	then
	CacheIP=$(cat dnsactual.conf)
fi
#echo $CacheIP

wget http://freedns.afraid.org/dynamic/check.php -o /dev/null -O afraid.log
CurreIP=$(tail afraid.log | grep Detected | cut -d : -f 2 | cut -d '<' -f 1 | tr -d " ")
#echo $CurreIP
if [ "$CurreIP" = "$CacheIP" ]
then
	# Both IP are equal
	echo "Update not required..."
else
	# The IP has change
	echo "Updating http://free.afraid.org with " $CurreIP
	wget http://freedns.afraid.org/dynamic/update.php?xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -o /dev/null -O afraid.log
	echo `date`  "Updating log with IP " $CurreIP >> dnsactual.log
fi
rm -f dnsactual.conf
echo $CurreIP > dnsactual.conf