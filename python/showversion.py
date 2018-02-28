#!/usr/bin/python
from jsonrpclib import Server
import json

switchusername = 'vagrant'
switchpassword = 'vagrant'
switch = 'leaf1a'

urlString = "http://{}:{}@{}/command-api".format(switchusername, switchpassword, switch)
switchReq = Server( urlString )
response = switchReq.runCmds( 1, ["show version"] )
print response
