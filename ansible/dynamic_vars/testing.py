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
    dir_list = os.listdir("../../flask/static")
    for name in dir_list:
        url_config = "http://flaskapi:5000/api/static/%s" % (name)
        url_result = requests.get(url_config, headers=headers, verify=False)
        url_json = json.loads(url_result.content.decode('utf-8'))
    return url_json 

testing = get_all_configs()
print(testing['hostname'])