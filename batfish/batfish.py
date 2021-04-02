#!/usr/bin/python3
from pybatfish.client.commands import *
from pybatfish.question.question import load_questions
from pybatfish.datamodel.flow import (HeaderConstraints,
                                         PathConstraints)
from pybatfish.question import bfq
import random
import sys

NETWORK_NAME = "test"
SNAPSHOT_NAME = "test"
SNAPSHOT_PATH = "data/"
BATFISH_SERVICE_IP = "batfish"

bf_session.host = BATFISH_SERVICE_IP
load_questions()

bf_init_snapshot(SNAPSHOT_PATH, name=SNAPSHOT_NAME, overwrite=True)

spine_lo0 = ["8.8.8.8/32","9.9.9.9/32"]
devices = ["base_lab_Spine1","base_lab_Spine2","base_lab_Leaf1","base_lab_Leaf2","base_lab_Leaf3","base_lab_Leaf4"]

#Check to see if all interfaces will come up when this is deployed
print("******** Showing all of the Interfaces which are connected ********")
int_check = bfq.interfaceProperties(properties="Active").answer()
print(int_check)

#Check to show all of the edge connected services 
print("******** Showing all of the edge connected servivces ********")
edge_services = bfq.bgpEdges().answer().frame()
print(edge_services)

#Check for peerings peerings
print("******** Showing BGP peering sessions for all nodes ********")
bgp_peers = bfq.bgpSessionStatus(nodes='/Leaf/').answer().frame()
print(bgp_peers)

#Make sure that we can achieve multipathing to the spines loopbacks
print("********** Checking leaf switches for loopback connectivity to spines ********")
for spineloopback0 in spine_lo0:
    routes_filtered = bfq.routes(network=spineloopback0).answer().frame()
    print(routes_filtered)

#Check to see if leaf 1 can traceroute to all devices 
#for device in devices:
 #   headers = HeaderConstraints(dstIps=device)
  #  print(bfq.traceroute(startLocation="leaf1[Loopback0]", headers=headers).answer().frame())