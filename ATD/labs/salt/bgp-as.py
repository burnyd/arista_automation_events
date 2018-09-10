#!/usr/bin/python

import os
import subprocess

def get_AS():
    grains = {}
    bgp_as = subprocess.check_output("FastCli -p 15 -c 'show ip bgp summary'| awk 'NR==2{print $7}'", shell=True).strip("\r\n")
    grains['bgp_as'] = bgp_as
    return grains

if __name__ == "__main__":
    get_AS()

