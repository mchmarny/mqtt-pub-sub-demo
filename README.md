# pub/sub demo

Simple demo illustrating pub/sub pattern using [MQTT](http://mqtt.org/) protocol implemented in [mosquitto](http://mosquitto.org/) broker.

> Requires mosquitto, an open source message broker that implements the MQ Telemetry Transport protocol version 3.1

## Start mosquitto

    $ mosquitto -c ./mosquitto.conf
    
> the local config file will hide most of the noise from the broker

## Publish

For the demo we will publish integers [1-32767] to the `data/val` topic

    $ ./pub.sh
    
## Subscribe

Subscribe to the `data/val` topic

    $ ./sub.sh

If the data value is out of range [5000-30000] do:

* Log the file to alert.log 
* Re-publish the data to the `alert/val` topic

## Monitor

Monitor the `alert/val` topic for out of range values

    $ ./mon.sh 
    

> Yes, this does not get any easier 
    
