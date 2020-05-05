#!/bin/bash

make 7skb:default:avrdude &

while :
do
  ls -1 /dev/ttyACM0 2>/dev/null
  if [ $? == 0 ]; then
    echo "Found keyboard"
    break 
  fi
  sleep 1
done
sudo chmod 777 /dev/ttyACM0

