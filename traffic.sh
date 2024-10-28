#!/bin/bash
# Input your Interface Name
ir=("ens160" "ens161" "ens192" "ens224" "ens256")
ip route
# Input your Interface Name
ifconfig ens160 down
ifconfig ens161 down
ifconfig ens192 down
ifconfig ens224 down
ifconfig ens256 down
sleep 3

ifc="${ir[$(( $RANDOM % 5 ))]}" 
ifconfig "$ifc" up
sleep 10
echo "$ifc"
ping -c 2 101.125.11.5
echo "$?"
tmp=`curl 101.125.11.5 -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:79.0) Gecko/20100101 Firefox/79.0'`
echo "$ifc"
ifconfig "$ifc" down
sleep 10
