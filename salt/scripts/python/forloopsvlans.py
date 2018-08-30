#!/usr/bin/python

import os
from jsonrpclib import Server

switchusername = 'vagrant'
switchpassword = 'vagrant'
switches = ['leaf1a']
vlans = ['600','700','800']

def add_vlans():
    for switch in switches:
    	for vlanlist in vlans:
    		urlString = "http://{}:{}@{}/command-api".format(switchusername, switchpassword, switch)
    		switchReq = Server( urlString )
    		response = switchReq.runCmds( 1, ["enable", "configure", "vlan" +" "+ str(vlanlist)] )
    		print "adding vlans %s" % (vlanlist)

add_vlans()

