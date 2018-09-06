from jinja2 import Environment, FileSystemLoader
import yaml
import sys

env = Environment(load=FileSystemLoad('templates'))
template = env.get_template('vlans.j2')
vlan_data = yaml.load(open('vlans.yaml'))
output = template.render(vlan)data)
with open("config", "wb") as fh:
    fh.write(output)

print output
