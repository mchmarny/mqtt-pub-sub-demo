#!/bin/bash

while [ true ]; do
  val=$(( $RANDOM ))
  mosquitto_pub -t "data/val" -m $val
  echo $val
  sleep 1
done
echo "DONE"



