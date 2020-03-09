
#!/usr/bin/python
import json
import requests

url = "http://flaskapi:5000/api/static/allvars.json"
headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

requests.packages.urllib3.disable_warnings()

result = requests.get(url, headers=headers, verify=False)

#converts json to python dictionary for the entire sutrcture. 
allstruct = json.loads(result.content.decode('utf-8'))

def get_devices_list():
    for devices in allstruct['devices']:
        return devices 
#print(json.dumps(testing, sort_keys=True, indent=4))

dynamic = get_devices_list()

inventory = {
    "grouptest": {
        "hosts": [
            "base_lab_Leaf1",
            "base_lab_Leaf2",
            "base_lab_Leaf3"
            ],
            "vars": {
                "ansible_connection": "local"
            }
        }
}

print(json.dumps(inventory, sort_keys=True, indent=2))