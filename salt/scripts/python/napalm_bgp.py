import json
from napalm import get_network_driver
driver = get_network_driver('eos')
dev = driver(hostname='leaf1a', username='vagrant',
             password='vagrant')
dev.open()
bgp_neighbors = dev.get_bgp_neighbors()
dev.close()
print(json.dumps(bgp_neighbors, sort_keys=True, indent=4))
