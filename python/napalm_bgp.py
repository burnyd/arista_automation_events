import json
from napalm import get_network_driver
driver = get_network_driver('eos')
dev = driver(hostname='127.0.0.1:8000', username='admin',
             password='admin')
dev.open()
bgp_neighbors = dev.get_bgp_neighbors()
dev.close()
print(json.dumps(bgp_neighbors, sort_keys=True, indent=4))
