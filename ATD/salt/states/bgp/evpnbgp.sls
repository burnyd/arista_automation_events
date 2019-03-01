{%- set spine_as = salt['mine.get']('spine1', 'grains.items.bgp_as').items %}

Add bgp leaf spine :
    netconfig.managed:
        - template_name: salt://templates/leaf1-evpn.jinja
        - spine_as: {{spine_as}} 
