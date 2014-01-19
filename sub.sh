#!/bin/bash

norm_min=5000
norm_max=30000

mosquitto_sub -t "data/#" | while read val; do
	ts=$(date +%s)
	if [[ $val -lt $norm_min || $val -gt $norm_max ]]
		then
			echo "ALERT: ${val} out of range [${norm_min}-${norm_max}] at $ts"; 
			echo "${ts},${val}" >> ./alert.log 
			mosquitto_pub -t "alert/val" -m "{'ts':${ts}, 'd':'oorv','v':${val}}"
		else
			echo "OK: ${val}"
	fi
done