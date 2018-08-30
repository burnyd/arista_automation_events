tell_minion_to_install_software:
  local.state.sls:
    - name: tell minion to install software
    - tgt: {{ data['id'] }}
    - arg:
      - leaf.vlans
