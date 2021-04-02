#!/usr/bin/python
import os
import sys
import argparse
import json

"""This script facilitates development and testing of SAND and AaaS Microservices in the GNCF lab.
One of the current challenges in developing Ansible playbooks that will be ported to AaaS is that any change, even minor, requires
a pull request and 2 peer reviewers.  This script simulates serializing data from SAND using JSON source files.  The script combines
host variables and global variables which mimics how AaaS handles it's inventory via a script local to that platform.  This script
can be used with ansible CLI (ansible-playbook) and can supply all the dynamic inventory needed.


Requirements:
-It's assumed the user has a lab Python virutal environment with Ansible installed.  
-This script was tested on Python 2.7 and Ansible 2.8.
-user has project folders in ~/pal/


Usage:  

1) Set target host and fabric

This is important to note that we currently run an AaaS MS against a single host at a time.  And the script
must know which host & fabric to generate dynamic inventory for.  So what we do here is set OS environment variables
on the lab Ansible host where you are doing your development work and the script uses these variables.  For example:

export TARGETHOST=D123456R761
export TARGETFABRIC=GNCF-PAL-CML-2 


2) Viewing Inventory Data:
python <this script name>

3) Running an Ansible playbook:
ansible-playbook -i <this script name> <playbook name>
"""


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--list', action = 'store_true')


    target = os.environ['TARGETHOST']
    fabric = os.environ['TARGETFABRIC']



    with open ('/var/tmp/dcf_staging_cantor/development/%s/%s.json' % (fabric,target), 'r') as target_intent_data:
        native_target_intent_data = json.load(target_intent_data)



    full_intent_payload = {}


    full_intent_payload.update(native_target_intent_data)


    data = {
        "target_hosts": {
            "hosts": [target]
        },
        "_meta": {
            "hostvars" : {
                target : full_intent_payload
            }
        }
    }

    json_data = json.dumps(data,indent=4)
    print json_data

if __name__ == '__main__':
    main()

