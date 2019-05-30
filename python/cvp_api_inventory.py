#!/usr/bin/env python
import requests
import json

username = 'daniel'
password = 'daniel123'
server = 'https://10.20.30.142'

connect_timeout = 10
headers = {"Accept": "application/json",
           "Content-Type": "application/json"}
requests.packages.urllib3.disable_warnings()
session = requests.Session()

def login(url_prefix, username, password):
    authdata = {"userId": username, "password": password}
    headers.pop('APP_SESSION_ID', None)
    response = session.post(url_prefix+'/web/login/authenticate.do', data=json.dumps(authdata),
                            headers=headers, timeout=connect_timeout,
                            verify=False)
    cookies = response.cookies
    headers['APP_SESSION_ID'] = response.json()['sessionId']
    if response.json()['sessionId']:
        return response.json()['sessionId']

def get_inventory(url_prefix):
    response = session.get(url_prefix+'/cvpservice/inventory/devices')
    #return response.json()
    return response.json()

login(server, username, password)
data = get_inventory(server1)
print json.dumps(data, indent=4)
