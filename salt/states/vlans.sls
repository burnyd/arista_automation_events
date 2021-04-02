#salt -G os:eos state.sls states.vlans test=True
Add vlans example:
    netconfig.managed:
        - template_name: salt://templates/vlans.jinja
        - skip_verify: False
        - vlans:
            - 300
            - 400
