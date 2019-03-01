{% load_yaml as yaml_src %}
  switches:
    leaf4a:
      hostname: leaf4a
      serial: ABCD12345678
{% endload %}
  switches_ztp:
    file.managed:
      - name: /opt/ztp/{{ yaml_src.switches.leaf4a.serial }}/running-config
      - source: salt://templates/running-config.jinja
      - template: jinja
      - context:
          host: {{ yaml_src.switches.leaf4a.hostname }}
