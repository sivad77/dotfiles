#!/bin/bash

while true; do
  
  sleep 120
  
  ac=`cat /sys/class/power_supply/ADP1/online`
  if [ $ac -eq "1" ]; then
    continue
  fi
  
  now=`cat /sys/class/power_supply/BAT0/energy_now`
  full=`cat /sys/class/power_supply/BAT0/energy_full`
  limit=$(( now * 7 ))
  
  if [ $limit -lt $full ]; then
    $HOME/bin/xmsg "LOW BATTERY"
  fi
done
