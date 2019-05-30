install vlans:
  local.state.sls:
    - name: Install vlans once the leaf boots up
    - tgt: {{ data['id'] }}
    - arg:
      - vlans.vlans
