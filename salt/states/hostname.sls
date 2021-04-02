#salt -G os:eos state.sls states.hostname test=True
hostname::
  netconfig.managed:
    - template_name:
        - salt://templates/host.jinja
    - debug: true
    - context:
        host: {{ opts.id }}
