#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

POLL_FREQ=$(jq --raw-output ".poll_freq" $CONFIG_PATH)
OBIHAI_HOST=$(jq --raw-output ".obihai_host" $CONFIG_PATH)
OBIHAI_USER=$(jq --raw-output ".obihai_user" $CONFIG_PATH)
OBIHAI_PASS=$(jq --raw-output ".obihai_pass" $CONFIG_PATH)
MQTT_HOST=$(jq --raw-output ".mqtt_host" $CONFIG_PATH)
MQTT_USER=$(jq --raw-output ".mqtt_user" $CONFIG_PATH)
MQTT_PASS=$(jq --raw-output ".mqtt_pass" $CONFIG_PATH)
MQTT_TOPIC=$(jq --raw-output ".mqtt_topic" $CONFIG_PATH)

cd /usr/local/obihai2mqtt/
php5 /usr/bin/composer install

while [ true ]; do
  echo Starting obihai2mqtt...
  php5 obihai2mqtt.php --poll_freq=$POLL_FREQ --obihai_host=$OBIHAI_HOST --obihai_user=$OBIHAI_USER --obihai_pass=$OBIHAI_PASS --mqtt_host=$MQTT_HOST --mqtt_user=$MQTT_USER --mqtt_pass=$MQTT_PASS --mqtt_topic=$MQTT_TOPIC
  sleep 5
done
