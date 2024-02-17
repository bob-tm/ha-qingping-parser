#!/usr/bin/env bashio

export MQTT_SERVER=$(bashio::config "MQTT_SERVER")
export MQTT_PORT=$(bashio::config "MQTT_PORT")
export MQTT_USER=$(bashio::config "MQTT_USER")
export MQTT_PASSWORD=$(bashio::config "MQTT_PASSWORD")
export SENSOR_MAC=$(bashio::config "SENSOR_MAC")
export SENSOR_TOPIC=$(bashio::config "SENSOR_TOPIC")
export ADVERTISE_HOME_ASSISTANT=$(bashio::config "ADVERTISE_HOME_ASSISTANT")
 
bun index.ts