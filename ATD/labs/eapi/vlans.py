import os
from jsonrpclib import Server

switchusername = 'arista'
switchpassword = 'arista'
switches = ['leaf1','leaf2']
vlans = ['600','700','800']

def add_vlans():
    for switch in switches:
        for vlanlist in vlans:
                urlString = "http://{}:{}@{}/command-api".format(switchusername, switchpassword, switch)
                switchReq = Server( urlString )
                response = switchReq.runCmds( 1, ["enable", "configure", "vlan" +" "+ str(vlanlist)] )
                print "adding vlans %s on switch %s" % (vlanlist, switch)

add_vlans()

