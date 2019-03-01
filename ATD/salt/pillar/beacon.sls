beacons:
  inotify:
    - files:
        /mnt/flash/startup-config:
          mask:
            - modify
    - disable_during_state_run: True
