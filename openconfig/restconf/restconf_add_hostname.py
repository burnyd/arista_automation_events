#!/usr/bin/python3.6

import requests
from requests.auth import HTTPBasicAuth
import json
 
USER = 'admin'
PASS = 'admin'
 
requests.packages.urllib3.disable_warnings()

api_call = "https://base_lab_Leaf1:6020/restconf/data/interfaces/interface=Ethernet2/config/"

#headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
headers = {'Content-Type': 'application/yang-data+json', 'Accept': 'application/yang-data+json'}

data = { 
    "openconfig-interfaces:description": "modified"
}
 
result = requests.post(api_call, auth=HTTPBasicAuth(USER, PASS), data=data, headers=headers, verify=False)

print(result)

if result.status_code == 200:
    	print ('Restconf call successful!')

check_int = "https://base_lab_Leaf1:6020/restconf/data/interfaces/interface=Ethernet2/state/description"
result_check = requests.get(check_int, auth=HTTPBasicAuth(USER, PASS), headers=headers, verify=False)

testing = json.loads(result_check.content.decode('utf-8'))
print(json.dumps(testing, sort_keys=True, indent=4))
