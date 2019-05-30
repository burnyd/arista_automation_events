#!/usr/bin/python

from jsonrpclib import Server

switchusername = 'admin'
switchpassword = 'admin'
switches = ['base-lab_Spine1']

def find_neighbors(): #Function makes sure that each and every API is actually running on each switches and can pull with the current password.
    for switch in switches:
        urlString = "https://%s:%s@%s/command-api" % (switchusername, switchpassword, switch)
        switchReq = Server( urlString )
        response = switchReq.runCmds( 1, ["show lldp neighbors"] )
        neighborresponse = response[0]["lldpNeighbors"]
        nodes = neighborresponse
        neighborlist = []
        for neighbors in nodes:
            iterateneighbors =  neighbors['neighborDevice']
            neighborlist.append(iterateneighbors)
        print neighborlist


find_neighbors()
