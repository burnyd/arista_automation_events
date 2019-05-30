#!/usr/bin/python
from jsonrpclib import Server
import json

switchusername = 'daniel'
switchpassword = 'daniel123'
switch = '10.20.30.24'

urlString = "http://{}:{}@{}/command-api".format(switchusername, switchpassword, switch)
switchReq = Server( urlString )
response = switchReq.runCmds( 1, ["show version"] )
json_response = json.dumps(response, indent=4)
#print response

print(json_response)
