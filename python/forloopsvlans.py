#!/usr/bin/python
from jsonrpclib import Server
import json

switchusername = 'admin'
switchpassword = 'admin'
switches = ['base-lab_Leaf1', 'base-lab_Leaf2']
vlans = ['600','700','800']

def add_vlans():
    for switch in switches:
    	for vlanlist in vlans:
    		urlString = "http://{}:{}@{}/command-api".format(switchusername, switchpassword, switch)
    		switchReq = Server( urlString )
    		response = switchReq.runCmds( 1, ["enable", "configure", "vlan" +" "+ str(vlanlist)] )
    		print "adding vlans %s on %s" % (vlanlist , switch)

def show_vlans():
    for switch in switches:
        urlString = "http://{}:{}@{}/command-api".format(switchusername, switchpassword, switch)
        switchReq = Server( urlString )
        response = switchReq.runCmds( 1, ["show vlan"] )
        print "Showing the vlans on %s" % (switch)
        print json.dumps(response, indent=4)



add_vlans()
show_vlans()
