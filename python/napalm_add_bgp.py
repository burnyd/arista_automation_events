from napalm import get_network_driver
driver = get_network_driver('eos')
dev = driver(hostname='127.0.0.1:8000', username='admin',
             password='admin')
dev.open()
dev.load_merge_candidate(filename='napalm_bgp.cfg')
dev.commit_config()
dev.close()
