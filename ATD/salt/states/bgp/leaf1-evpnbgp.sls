{%- set spine_as = 65001 %}

Add bgp leaf spine :
    netconfig.managed:
        - template_name: salt://templates/leaf1-evpn.jinja
        - spine_as: {{spine_as}} 
