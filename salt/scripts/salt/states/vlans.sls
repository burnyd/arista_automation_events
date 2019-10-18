Add vlans example:
    netconfig.managed:
        - template_name: salt://vlans.jinja
        - skip_verify: False
        - vlans:
            - 300
            - 400
