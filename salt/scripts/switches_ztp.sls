{% import_yaml '/srv/salt/test.yml' as test %}
  switches_ztp:  
    file.managed:
      - source: salt://templates/running-config.jinja
      - name: /opt/ztp/{{ test.serial }}/running-config
      - user: vagrant
      - group: vagrant
      - mode: 644
      - template: jinja
