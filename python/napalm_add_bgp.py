from napalm import get_network_driver
driver = get_network_driver('eos')
dev = driver(hostname='base-lab_Leaf1', username='admin',
             password='admin')
dev.open()
dev.load_merge_candidate(filename='napalm_bgp.cfg')
dev.commit_config()
dev.close()
