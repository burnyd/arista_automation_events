#!/usr/bin/python3.6

import requests
from requests.auth import HTTPBasicAuth
import json
 
USER = 'admin'
PASS = 'admin'
 
requests.packages.urllib3.disable_warnings()

api_call = "https://base_lab_Leaf1:6020/restconf/data/interfaces/interface=Ethernet1/state/description"
#api_call = "https://base_lab_Leaf1:6020/restconf/data/lldp"
#api_call = "https://base_lab_Leaf1:6020/restconf/data/arista/eos/mlag"

headers = {'Content-Type': 'application/yang-data+json', 'Accept': 'application/yang-data+json'}
 
result = requests.get(api_call, auth=HTTPBasicAuth(USER, PASS), headers=headers, verify=False)

print(result)
testing = json.loads(result.content.decode('utf-8'))
print(json.dumps(testing, sort_keys=True, indent=4))
