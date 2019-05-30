import netaddr

Loopback1 = ‘10.1.1.255’
Loopback2 = ‘10.1.1.555’

netaddr.IPnetwork(loopback1)

netaddr.IPnetwork(loopback2)

svi = ‘10.1.2.0’

netaddr.IPNetwork(svi)
