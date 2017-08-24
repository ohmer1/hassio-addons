# HASS.IO addons repository

# obihai2mqtt
Currently the only addon included in the repository.

Once installed, configure the addon with the required parameters in the HASS.IO configuration panel. See https://github.com/ohmer1/obihai2mqtt for more information about supported parameters.

Your phone line will be published to your MQTT server. Simply add a new mqtt sensor into your Home Assistant configuration.

Sample sensor configuration:
```yml
sensor:
  - platform: mqtt
    name: home_phone
    # In this example, it uses the default "obihai" topic. 
    # If you also use line2 on your ATA, you'll need to also add a second sensor 
    # with the "obihai/state_line2" topic.
    state_topic: 'obihai/state_line1'
    # Ignore value after 120 seconds.
    # If the script crash, it will return status *unknown" instead of a stalled value.
    expire_after: 120
```

Sample automation : make kodi to pause when phone is ringing:
```yml
automation:
  - alias: Pause Kodi when phone is ringing
    trigger:
      platform: state
      entity_id: sensor.home_phone
      to: 'Ringing'
    condition:
      condition: and
      conditions:
        - condition: state
          entity_id: media_player.kodi
          state: playing
    action:
      service: media_player.media_pause
      entity_id: media_player.kodi
```
