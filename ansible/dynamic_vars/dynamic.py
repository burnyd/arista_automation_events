#!/usr/bin/python
#Change the common structure so it breaks out leafs/spines as well as all devices. 
import json
import requests
import os 
import glob 

common_url = "http://flaskapi:5000/api/static/common.json"
headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

requests.packages.urllib3.disable_warnings()
common_result = requests.get(common_url, headers=headers, verify=False)
common = json.loads(common_result.content.decode('utf-8'))

def get_leafdevices():
    empty_list = []
    for devices in common['leafs']:
        empty_list.append(devices)
    return empty_list 

def get_spinedevices():
    empty_list = []
    for devices in common['spines']:
        empty_list.append(devices)
    return empty_list 

def get_all_configs():
    url_config = "http://flaskapi:5000/api/static/allvars.json"
    url_result = requests.get(url_config, headers=headers, verify=False)
    url_json = json.loads(url_result.content.decode('utf-8'))
    return url_json

leaf_dynamic = get_leafdevices()
spine_dynamic= get_spinedevices()
allvars = get_all_configs()

inventory = {
    "leafs": {
        "hosts": leaf_dynamic,
           "vars": allvars,
    },
    "spines": {
        "hosts": spine_dynamic,
           "vars": allvars
    }
} 

print(json.dumps(inventory, sort_keys=True, indent=2))