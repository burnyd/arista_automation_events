Add vlans example:
    netconfig.managed:
        - template_name: salt://vlans.jinja
        - skip_verify: False
        - vlans:
            - 600
            - 700
            - 800
