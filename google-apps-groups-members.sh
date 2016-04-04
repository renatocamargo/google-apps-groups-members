#!/bin/bash

GAM=/home/renato/Downloads/GAM-3.65/src/gam.py

for i in $($GAM print groups name | awk -F "," '{print $1}'); do
	count=$($GAM info group $i | grep "directMembersCount:" | awk -F " " '{print $2}')
	echo $i
	$GAM info group $i | egrep -v "ExternalMembers|directMembersCount|whoCanViewMembership" | fgrep -A $count Members
	echo " "
done