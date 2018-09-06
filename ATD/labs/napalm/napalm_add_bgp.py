
from napalm import get_network_driver
driver = get_network_driver('eos')
dev = driver(hostname='leaf1a', username='vagrant',
             password='vagrant')
dev.open()

dev.load_merge_candidate(filename='napalm_bgp.cfg')
dev.commit_config()
dev.close()
