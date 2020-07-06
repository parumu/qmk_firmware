#!/bin/bash

ls lib/lufa/LUFA >/dev/null 2>&1
r=$?
if [ $r -ne 0 ]; then 
  make git-submodule
fi

keyboard=/dev/ttyACM0
keymap=7skb:default

make $keymap:avrdude &
pid=$!

while :
do
  ls -1 $keyboard 2>/dev/null
  if [ $? == 0 ]; then
    break 
  fi
  sleep 1
done
sudo chmod 777 $keyboard

wait $pid
