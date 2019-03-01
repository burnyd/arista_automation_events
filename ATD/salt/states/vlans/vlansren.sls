Add vlans example:
    netconfig.managed:
        - template_name: salt://templates/vlansren.jinja
        - skip_verify: False
        - template: jinja

