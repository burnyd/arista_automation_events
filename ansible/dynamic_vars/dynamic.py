#!/usr/bin/python
#Change the common structure so it breaks out leafs/spines as well as all devices. 
import json
import requests

common_url = "http://flaskapi:5000/api/static/common.json"
url = "http://flaskapi:5000/api/static/common.json"
headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

requests.packages.urllib3.disable_warnings()

result = requests.get(url, headers=headers, verify=False)

common_result = requests.get(common_url, headers=headers, verify=False)

#converts json to python dictionary for the entire sutrcture. 
allstruct = json.loads(result.content.decode('utf-8'))
common = json.loads(common_result.content.decode('utf-8'))

def get_devices_list():
    empty_list = []
    for devices in allstruct['devices']:
        empty_list.append(devices)
    return empty_list 

dynamic = get_devices_list()

inventory = {
    "grouptest": {
        "hosts": dynamic,
            "vars": {
            }
        }
}
#Add the common dictionary
"""
{
    "leafs": {
        "hosts": [
            "db1.example.com"
        ]
    },
    "spines": {
        "hosts": [
            "db1.example.com",
            "web1.example.com",
            "worker4.example.com"
        ]
    },
"""

inventory['grouptest']['vars'] = common

print(json.dumps(inventory, sort_keys=True, indent=2))