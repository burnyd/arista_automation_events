import json
from napalm import get_network_driver
driver = get_network_driver('eos')
dev = driver(hostname='base_lab_Leaf1', username='admin',
             password='admin')
dev.open()
bgp_neighbors = dev.get_bgp_neighbors()
dev.close()
print(json.dumps(bgp_neighbors, sort_keys=True, indent=4))
