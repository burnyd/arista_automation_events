#!/usr/bin/python

from binding import openconfig_bgp
import json
import pyangbind.lib.pybindJSON as pybindJSON

ocbgp = openconfig_bgp()

ocbgp.bgp.global_.config.as_ = 1 #Configures the rw bgp - > global - > config passes in the oc-inet:as-number

ocbgp.bgp.global_.config.router_id = "1.1.1.1" #Passes in the rw bgp - > global - > config - > router-id passes in the oc-yang:dotted-quad

ocbgp.bgp.global_.graceful_restart.config.enabled = True # rw bgp - > global - > graceful-restart - > config - > enabled #Boolean either true or false.

ocbgp.bgp.global_.use_multiple_paths.config.enabled = True # rw bgp - > global - > graceful-restart - > config - > enabled #Boolean either true or false.

ocbgp.bgp.neighbors.neighbor.add("10.0.11.3")

ocbgp.bgp.neighbors.neighbor["10.0.11.3"].config.peer_as = 10
ocbgp.bgp.neighbors.neighbor["10.0.11.3"].config.description = "Spine 1"

print(pybindJSON.dumps(ocbgp, mode="ietf"))

json_data = pybindJSON.dumps(ocbgp, mode="ietf")

with open("json/bgp.json", 'w') as f:
  f.write(json_data) 