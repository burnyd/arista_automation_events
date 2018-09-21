import netaddr

loopbackrange = netaddr.IPSet(netaddr.IPRange("10.0.0.0", "10.0.0.25"))

for i in loopbackrange: print i
