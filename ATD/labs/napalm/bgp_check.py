from napalm import get_network_driver
driver = get_network_driver('eos')

leafs = ['leaf1','leaf2']

for leaf in leafs:
  from napalm import get_network_driver
  driver = get_network_driver('eos')
  dev = driver(hostname=leaf, username='arista',
               password='arista')
  dev.open()
  neighbors = dev.get_bgp_neighbors()
  for neighbor in neighbors['global']['peers']:
    print 'Device %s has a neighborship of %s' % (leaf, neighbor)

    


